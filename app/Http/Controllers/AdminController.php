<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Buku;
use App\Models\Ebook;
use App\Models\Peminjaman;
use App\Models\User;

class AdminController extends Controller
{
    public function index()
    {
        $countBuku = Buku::count();
        $countEbook = Ebook::count();
        $countPeminjaman = Peminjaman::where('allowed', '1')->count();
        $countJurnal = Ebook::where('kategori', 'LIKE', 'Jurnal')->count();
        return view('admin.index', [
            'buku' => Buku::latest()->sortable()->paginate(8),
            'user' => User::latest()->get(),
            'countBuku' => $countBuku,
            'countEbook' => $countEbook,
            'countPeminjaman' => $countPeminjaman,
            'countJurnal' => $countJurnal
        ]);
    }
    public function buku(Request $request)
    {
        if ($request->has('cari')) {
            $data = Buku::where('judul', 'like', "%" . $request->cari . "%")->sortable()->paginate(8);
        } else {
            $data = Buku::sortable()->paginate(8);
        }
        return view('admin.buku.buku', [
            'buku' => $data,
            'count' => Buku::count()
        ]);
    }
    public function ebook(Request $request)
    {
        if ($request->has('cari')) {
            $data = Ebook::where('judul', 'like', "%" . $request->cari . "%")->paginate();
        } else {
            $data = Ebook::sortable()->paginate(8);
        }
        return view('admin.ebook.ebook', [
            'ebook' => $data,
            'count' => Ebook::count()
        ]);
    }
    public function jurnal(Request $request)
    {
        if ($request->has('cari')) {
            $data = Ebook::where('judul', 'like', "%" . $request->cari . "%")->where('kategori', 'Jurnal')->paginate(8);
        } else {
            $data = Ebook::where('kategori', 'Jurnal')->latest()->paginate(8);
        }
        return view('admin.jurnal.jurnal', [
            'jurnal' => $data
        ]);
    }
    public function peminjaman(Request $request)
    {
        if ($request->has('cari')) {
            $test = Peminjaman::with('buku', 'user', 'civitas')->where('users.name', "LIKE", "%$request->cari%")->get();
            // $test = Peminjaman::join('users', 'peminjamen.user_id', '=', 'users.id')->join('bukus', 'peminjamen.buku_id', '=', 'bukus.id')->join('civitas', 'peminjamen.civitas_id', '=', 'civitas.id')->where('users.name', "LIKE", "%$request->cari%")->paginate(8);
            // dd($test);
        } else {
            // $test = Peminjaman::join('users', 'peminjamen.user_id', '=', 'users.id')->join('bukus', 'peminjamen.buku_id', '=', 'bukus.id')->join('civitas', 'peminjamen.civitas_id', '=', 'civitas.id')->where('allowed', '1')->paginate(8);
            $test = Peminjaman::with('user', 'buku', 'civitas')->where('allowed', '1')->get();
        }

        return view('admin.peminjaman', [
            'peminjaman' => $test
        ]);
    }
    public function manageUser(Request $request)
    {
        if ($request->has('cari')) {
            $data = User::where('name', 'like', "%" . $request->cari . "%")->paginate(8);
        } else {
            $data = User::where('status', '1')->latest()->paginate(8);
        }
        return view('admin.user.index', [
            'user' => $data,
        ]);
    }
    public function requestPeminjaman()
    {
        return view('admin.request_peminjaman', [
            'peminjaman' => Peminjaman::where('allowed', '0')->latest()->paginate(8),
            // 'user' => User::latest()->paginate(8),
        ]);
    }
}
