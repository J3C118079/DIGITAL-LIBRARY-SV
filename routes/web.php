<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\BantuanController;
use App\Http\Controllers\BukuController;
use App\Http\Controllers\EbookController;
use App\Http\Controllers\FavoritEbookController;
use App\Http\Controllers\JurnalController;
use App\Http\Controllers\PeminjamanController;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\UserAuth;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use App\Mail\WelcomeMail;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// DEFAULT LANDING, WILL CHANGE LATER
// Route::get('/', function () {return view('welcome');})->name('landing');
// ADMIN
Route::get('/administrator/countPinjam', [PeminjamanController::class, 'countPinjam']);
Route::get('/administrator/countUser', [UserController::class, 'countUser']);
Route::get('/administrator/countSbp', [RequestController::class, 'countSbp']);

Route::group(['prefix' => 'administrator', 'middleware' => 'role:1'], function () {
    Route::get('/', [AdminController::class, 'index']);
    // BUKU
    Route::get('/buku', [AdminController::class, 'buku']);
    Route::get('/buku/create', [BukuController::class, 'create']);
    Route::post('/buku/store', [BukuController::class, 'store']);
    Route::get('/buku/{buku:slug}/edit', [BukuController::class, 'edit']);
    /**
     * Saran untuk pengembang, saat akan mengambangkan edit, dapat menggunakan metod patch atau put
     */
    Route::patch('/buku/{buku:slug}/edit', [BukuController::class, 'update']);
    Route::delete('/buku/{buku:slug}/delete', [BukuController::class, 'destroy']);
    // EBOOK
    // Route::get('/ebook/cari',[SearchController::class,'cari']);
    Route::get('/ebook', [AdminController::class, 'ebook']);
    Route::get('/ebook/create', [EbookController::class, 'create']);
    Route::post('/ebook/store', [EbookController::class, 'store']);
    Route::get('/ebook/{ebook:slug}/edit', [EbookController::class, 'edit']);
    Route::patch('/ebook/{ebook:slug}/edit', [EbookController::class, 'update']);
    Route::delete('/ebook/{ebook:slug}/delete', [EbookController::class, 'destroy']);
    // JURNAL
    Route::get('/jurnal', [AdminController::class, 'jurnal']);
    Route::get('/jurnal/create', [JurnalController::class, 'create']);
    Route::post('/jurnal/store', [JurnalController::class, 'store']);
    Route::get('/jurnal/{ebook:slug}/edit', [JurnalController::class, 'edit']);
    Route::patch('/jurnal/{ebook:slug}/edit', [JurnalController::class, 'update']);
    Route::delete('/jurnal/{ebook:slug}/delete', [JurnalController::class, 'destroy']);
    // PEMINJAMAN
    Route::get('/peminjaman', [AdminController::class, 'peminjaman']);
    Route::get('/peminjaman/request', [AdminController::class, 'requestPeminjaman']);
    #Route::get('/peminjaman/request/{peminjaman:id}/accept', [PeminjamanController::class, 'acceptRequestPeminjaman']);
    Route::delete('/peminjaman/request/{peminjaman:id}/delete', [PeminjamanController::class, 'deleteRequestPeminjaman']);
    #Route::get('/peminjaman/{peminjaman:id}/return', [PeminjamanController::class, 'kembali']);
    Route::get('/report', [PeminjamanController::class, 'userDenda']);
    Route::delete('/peminjaman/{peminjaman:id}/delete', [PeminjamanController::class, 'destroy']);

    #EXPORT EXCEL PEMINJAMAN
    Route::get('/peminjaman/export_excel', [PeminjamanController::class, 'export_excel']);

    Route::post('/peminjaman/accept', [PeminjamanController::class, 'acceptPinjam']);
    Route::post('/peminjaman/return', [PeminjamanController::class, 'kembali']);
    // SURAT BEBAS PUSTAKA
    Route::get('/sbp/view', [RequestController::class, 'viewData']);
    Route::get('/sbp', [RequestController::class, 'sbp']);
    Route::get('/sbp/{rekues:id}/accept', [RequestController::class, 'acceptSbp']);
    Route::delete('/sbp/{rekues:id}/delete', [RequestController::class, 'rejectSbp']);
    Route::delete('/sbp/view/{rekues:id}/delete', [RequestController::class, 'destroy']);

    #EXPORT EXCEL PEMINJAMAN
    Route::get('/sbp/view/export_excel', [RequestController::class, 'export_excel']);

    // MANAGE USER
    Route::get('/user', [AdminController::class, 'manageUser']);
    Route::get('/user/{user:id}/edit', [UserController::class, 'edit']);
    Route::patch('/user/{user:id}/edit', [UserController::class, 'update']);
    Route::delete('/user/{user:id}/delete', [UserController::class, 'delete']);

    Route::get('/user/registrasi', [UserController::class, 'registrasiUser']);
    Route::get('/user/{user}/accregis', [UserController::class, 'acceptRegis']);
    // BANTUAN
    Route::get('/bantuan', [BantuanController::class, 'index']);
});

Route::get('/sedang-dibaca', [EbookController::class, 'dibaca']);
Route::get('/sedang-dipinjam', [BukuController::class, 'pinjam']);

// EBOOK
// Route::view('/ebook', 'ebook');
Route::view('/read', 'ebook.read')->name('read');
// KEBIJAKAN
Route::view('/kebijakan', 'kebijakan')->name('kebijakan');
// TENTANG
Route::view('/tentang', 'tentang')->name('tentang');
// AUTHENTICATION
Route::view('/kebijakan', 'kebijakan')->name('kebijakan');
Route::view('/bantuan', 'syarat')->name('syarat');
Route::post('/bantuan/post', [BantuanController::class, 'store']);

// Route::get('/testingdulu', function() {
//   return new WelcomeMail(); 
// });

Route::group(['middleware' => 'auth'], function () {
    Route::get('/', function () {
        return redirect()->to('/home');
    });

    // BUKU
    Route::get('/kategori-buku', [BukuController::class, 'index']);
    Route::get('/direquest', [BukuController::class, 'direquest']);
    Route::get('/kategori-buku/terbaru', [BukuController::class, 'bukuTerbaru']);
    Route::get('/kategori-buku/novel', [BukuController::class, 'bukuNovel']);
    Route::get('/kategori-buku/tugas-akhir', [BukuController::class, 'bukuTA']);
    Route::get('/kategori-buku/{buku:slug}', [BukuController::class, 'show']);
    Route::post('/kategori-buku/{buku:slug}/pinjam', [BukuController::class, 'peminjamanBuku']);
    // EBOOK
    Route::get('/kategori-ebook', [EbookController::class, 'indexEbook']);
    Route::get('/kategori-ebook/novel', [EbookController::class, 'novel']);
    Route::get('/kategori-ebook/terbaru', [EbookController::class, 'terbaru']);
    Route::get('/kategori-ebook/jurnal', [EbookController::class, 'jurnal']);
    Route::get('/kategori-ebook/{ebook:slug}', [EbookController::class, 'show']);
    // NAMBAH FAVORIT
    Route::post('/clickfavorite', [EbookController::class, 'favorit']);
    // PROFIL
    Route::get('/profil/{user:name}', [RequestController::class, 'tabProfil']);
    Route::get('/profil/{user:name}/cetak', [RequestController::class, 'printPeminjaman']);
    Route::view('/denda', 'denda');
    Route::get('/{user:nim}/request', [RequestController::class, 'index']);
    // MENU FAVORIT
    Route::get('/favorit', [FavoritEbookController::class, 'index']);
    // Route::get('/profil', [BukuController::class, 'pinjam']);
});

// Route::get('/buku', [BukuController::class, 'index']);
Auth::routes();
Route::post('/registerTest', [RegisterController::class, 'store']);
// DEFAULT HOME
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
