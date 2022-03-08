<?php

namespace App\Exports;

use App\Models\Peminjaman;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithStyles;
use DB;
use Milon\Barcode\DNS1D;


class PeminjamanExport implements FromCollection,WithMapping,WithHeadings,WithStyles,WithColumnWidths
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $data = Peminjaman::with('user', 'buku', 'civitas')->where('allowed', '1')->get();
        return $data;
    }

    public function map($peminjaman): array
    {
        return [
            $peminjaman->civitas->nama,
            $peminjaman->buku->judul,
            $peminjaman->user->name,
            $peminjaman->status,
            $peminjaman->created_at,
            $peminjaman->lastreturn,
            $peminjaman->id,
        


        ];
    }

    public function headings(): array
    {
        return [
            'Title',
            'Buku', 
            'Nama',
            'Status',
            'Dibuat',
            'Dikembalikan',
            'Barcode-Code',
       
           
        
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 20,
            'B' => 40,  
            'C' => 20, 
            'D' => 20,  
            'E' => 25,
            'F' => 25,                                                                                              
            'G' => 25,                         
        ];
    }

    public function styles(Worksheet $sheet)
    {
       
        $styleArray = [
            'font' => [
                'size' =>14,
                'bold' => true,
                'color' => array('rgb' => 'FFFFFF')
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                ],
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
                'rotation' => 90,
                'color' => array('rgb' => '2273A7')
            ],
        ];   
        $styleArrayIsi = [
            'font' => [
                'size' =>12,
                'bold' => false,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                ],
            ],
         
        ];   
        $sheet->getStyle(
            'A2:' . 
            $sheet->getHighestColumn() . 
            $sheet->getHighestRow()
        )->applyFromArray($styleArrayIsi);
        $sheet->getStyle('A1:G1')->applyFromArray($styleArray);
    }
}
