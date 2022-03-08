<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Peminjaman;
use Carbon\Carbon;

use Illuminate\Support\Facades\DB;
use App\Exports\PeminjamanExport;
use Maatwebsite\Excel\Facades\Excel;


class PeminjamanController extends Controller
{
    public function acceptRequestPeminjaman(Peminjaman $peminjaman)
    {
        // dd($peminjaman['id']);
        $dataPinjam = Peminjaman::find($peminjaman->id);
        $dataPinjam->allowed = '1';

        $tanggalSekarang = date('Y-m-d');
        $tanggal = date_create($tanggalSekarang);
        $tanggal = date_add($tanggal, date_interval_create_from_date_string('7 days'));

        $dataPinjam->lastreturn = $tanggal;
        $dataPinjam->save();

        session()->flash('success', 'Data peminjaman berhasil di accept');
        return redirect()->back();
    }
    // public function kembali(Peminjaman $peminjaman)
    // {
    //     if($peminjaman->status !== 'Dikembalikan' ) {
    //         $peminjaman->status = 'Dikembalikan';
    //     }
    //     $peminjaman->save();
    //     session()->flash('success', 'Data peminjaman berhasil diupdate');
    //     return redirect()->back();

    // }

    public function kembali(Request $request)
    {
        $peminjaman = Peminjaman::where('id', $request->id_pinjam)->get();

        if ($peminjaman->count() != null) {
            $dataPinjam = Peminjaman::find($request->id_pinjam);
            if ($dataPinjam->status !== 'Dikembalikan') {
                $dataPinjam->status = 'Dikembalikan';
                $dataPinjam->save();
                session()->flash('success', 'Buku berhasil dikembalikan');
                return redirect()->back();
            } else {
                session()->flash('error', 'Buku sudah dikembalikan');
                return redirect()->back();
            }
        }


        session()->flash('error', 'Data peminjaman gagal diupdate');
        return redirect()->back();
    }

    public function deleteRequestPeminjaman(Peminjaman $peminjaman)
    {
        $peminjaman->delete();
        return redirect()->back();
    }

    public function denda(Peminjaman $peminjaman)
    {
        $dataPinjam = $peminjaman::with('buku')->get()[3];
        // echo Carbon::parse($dataPinjam->lastreturn)->day;
        $denda = 0;
        $tanggalReturn = Carbon::parse($dataPinjam->lastreturn)->day;
        echo $tanggalReturn;
        echo date('d');
        if ($tanggalReturn <= date('d')) {
            $denda = date('d') - $tanggalReturn;
        }
        return $denda;
    }

    public function countPinjam()
    {
        return response()->json([
            'data' => Peminjaman::where('allowed', '0')->count()
        ]);
    }

    public function acceptPinjam(Request $request)
    {
        $peminjaman = Peminjaman::where('id', $request->id_pinjam)->get();

        if ($peminjaman->count() != null) {
            $dataPinjam = Peminjaman::find($request->id_pinjam);
            $dataPinjam->allowed = '1';

            $tanggalSekarang = date('Y-m-d');
            $tanggal = date_create($tanggalSekarang);
            $tanggal = date_add($tanggal, date_interval_create_from_date_string('7 days'));

            $dataPinjam->lastreturn = $tanggal;
            $dataPinjam->save();


            session()->flash('success', 'Data peminjaman berhasil di accept');
            return redirect()->back();
        }

        session()->flash('error', 'Buku gagal dipinjam');
        return redirect()->back();
    }

    public function userDenda()
    {
//        dd(DB::table('peminjamen')
//            ->join('users', 'peminjamen.user_id', '=', 'users.id')
//            ->join('bukus', 'peminjamen.buku_id', '=', 'bukus.id')
//            ->select('users.*', 'peminjamen.*', 'bukus.judul')
//            ->where('peminjamen.status', '=', 'Denda')
//            ->get());
        return view('admin.report_denda', [
            'user' => DB::table('peminjamen')
                ->join('users', 'peminjamen.user_id', '=', 'users.id')
                ->join('bukus', 'peminjamen.buku_id', '=', 'bukus.id')
                ->select('users.*', 'peminjamen.*', 'bukus.judul')
                ->where('peminjamen.status', '=', 'Denda')
                ->get()
        ]);
    }

    public function destroy(Peminjaman $peminjaman){
        $peminjaman->delete();
        session()->flash('success', 'Data berhasil terhapus');
        return redirect()->to('/administrator/peminjaman');
    }

    public function export_excel(){
        $now = Carbon::now();
        return Excel::download(new PeminjamanExport, 'peminjaman-'.$now.'.xlsx');
    }
}
