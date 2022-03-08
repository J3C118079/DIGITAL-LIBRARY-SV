<?php

namespace App\Exports;

use App\Models\Rekues;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithStyles;

class SbpExport implements FromCollection,WithMapping,WithHeadings,WithStyles,WithColumnWidths
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Rekues::where('status', '1')->get();
    }

    public function map($sbp): array
    {
        return [
            $sbp->requester,
            $sbp->user->nim,
            $sbp->created_at


        ];
    }

    public function headings(): array
    {
        return [
            'Nama',
            'NIM', 
            'Dibuat',
       
           
        
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 20,
            'B' => 20,  
            'C' => 20,                       
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
        $sheet->getStyle('A1:C1')->applyFromArray($styleArray);
    }
}
