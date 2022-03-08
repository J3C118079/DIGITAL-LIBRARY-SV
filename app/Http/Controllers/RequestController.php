<?php

namespace App\Http\Controllers;

use App\Models\Peminjaman;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;
use App\Models\Rekues;
use App\Models\User;
use DateTime;
use DB;
use Carbon\Carbon;
use App\Exports\SbpExport;
use Maatwebsite\Excel\Facades\Excel;

class RequestController extends Controller
{
    public function index(Request $request)
    {
        if (isset($_GET['button'])) {
            // dd($request->nama);
            $nama = $request->nama;
            $id = $request->id;
            Rekues::updateOrCreate([
                'requester' => $nama,
                'user_id' => $id,
                'requesting' => '1',
                'status' => '0',
            ]);
            session()->flash('success', 'Berhasil request untuk Surat Bebas Pustaka, mohon menunggu untuk dikonfirmasi, terimakasih.');
            return redirect()->back();
        } else {
            session()->flash('error', 'Gagal untuk me-request Surat Bebas Pustaka.');
            return redirect()->back();
        }
    }
    public function tabProfil(User $user)
    {
        $totalDenda = Peminjaman::where(['user_id' => $user->id, 'status' => 'Denda'])->get();
        $total = 0;
        $date2 = new DateTime(date('y-m-d'));
        foreach ($totalDenda as $d) {
            $date1 = new DateTime(date('y-m-d', strtotime($d->lastreturn)));
            $interval = $date1->diff($date2);
            // dd($totalDenda);
            $total += $interval->d + 1;
        }
        // dd($user);
        // dd($total);
        // dd($totalDenda);
        // dd(Peminjaman::where('status', 'Denda')->orWhere('status', 'Pinjam')->where('user_id', $user->id)->count());
        // dd(Peminjaman::whereRaw('user_id = ? AND status ="Denda" OR user_id = ? AND status ="Pinjam"', [$user->id, $user->id])->count());
        return view('profil', [
            'data' => Rekues::where('user_id', $user->id)->first(),
            'status' => $user->civitas_id,
            'riwayat' => Peminjaman::whereRaw('user_id = ? AND status ="Denda" OR user_id = ? AND status ="Pinjam"', [$user->id, $user->id])->count(),
            'denda' => Peminjaman::with('buku')->where(['status' => 'Denda', 'user_id' => $user->id])->get(),
            'totalDenda' => $total
            // where(['user_id' => $user->id, 'status' => 'Pinjam'])
        ]);
    }
    public function rejectSbp(Rekues $rekues)
    {
        $rekues->delete();
        return redirect()->back();
    }
    public function printPeminjaman(User $user)
    {   
        $dt = new DateTime();
        echo $dt->format('Y-m-d H:i:s');
        $data = DB::table('tbl_sbp')->get();
        $inc_download = array(
            'nomor_sbp' => $data[0]->nomor_sbp+1
        );
        DB::table('tbl_sbp')->where('nomor_sbp',0)->update($inc_download);
        $pdf = PDF::loadview('admin.test_cetak', [
            'nama' => $user->name,
            'program_studi' => $user->prodi,
            'nim' => $user->nim,
            'nosurat' => $inc_download['nomor_sbp']
        
        ]);
        return $pdf->download($user->name . '_' . $user->nim . '.pdf');
    }
    
    public function sbp()
    {
        return view('admin.sbp', [
            'sbp' => Rekues::where('status', '0')->latest()->paginate(8),
        ]);
    }

    public function viewData()
    {
        return view('admin.view_sbp', [
            'sbp' => Rekues::where('status', '1')->get()
        ]);
    }
    public function acceptSbp(Rekues $rekues)
    {
        // dd($peminjaman['id']);
        $dataPinjam = Rekues::find($rekues->id);
        $dataPinjam->status = '1';
        $dataPinjam->save();

        session()->flash('success', 'Data peminjaman berhasil di accept');
        return redirect()->to('/administrator/sbp');
    }

    public function countSbp()
    {
        return response()->json([
            'data' => Rekues::where('status', '0')->count()
        ]);
    }

    public function destroy(Rekues $rekues){
        $rekues->delete();
        session()->flash('success', 'Data berhasil terhapus');
        return redirect()->to('/administrator/sbp/view');
    }

    public function export_excel(){
        $now = Carbon::now();
        return Excel::download(new SbpExport, 'SBP-'.$now.'.xlsx');
    }
}
