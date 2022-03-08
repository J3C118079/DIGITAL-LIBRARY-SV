@extends('admin.layouts.master')
@section('title', 'Admin - Peminjaman')
@section('content')
    <div class="content">
        <div class="row">
            <div class="col-md-12">
            @include('admin.layouts.alert')
                <div class="card">
                    <div class="card-body">
                        {{--<p>Cari Data Buku Fisik :</p>--}}
                        {{--<form action="/administrator/peminjaman" method="GET">
                            <input type="text" name="cari" style="outline: none;"
                                class="px-2 py-2 rounded border border-info" placeholder="Cari .."
                                value="{{ old('cari') }}">
                            <button type="submit" class="ml-1 btn btn-primary btn-fab btn-icon btn-round"><i
                                    class="nc-icon nc-zoom-split"></i></button>
                        </form>--}}
                        <a href="/administrator/peminjaman/export_excel" role="button" class="btn btn-success btn-fab p-2">Export</a>
                        <div class="table-responsive">
                            <table class="table">
                                <thead class=" text-primary">
                                    <th>
                                        Aksi
                                    </th>
                                    <th>
                                        @sortablelink('civitas_id', 'Title')
                                    </th>
                                    <th>
                                        @sortablelink('buku_id', 'Buku')
                                    </th>
                                    <th>
                                        @sortablelink('user_id', 'Nama')
                                    </th>
                                    <th>
                                        @sortablelink('status')
                                    </th>
                                    <th class="text-center">
                                        Barcode
                                    </th>
                                </thead>
                                <tbody>
                                    @if (!$peminjaman->count())
                                        <tr>
                                            <td colspan="5" class="text-center"><i>Data peminjaman kosong</i></td>
                                        </tr>
                                    @else
                                        @php
                                            $nomor = 1;
                                        @endphp
                                        @foreach ($peminjaman as $b)
                                            <tr>
                                                
                                                <td>
                                                @if($b->status !== "Dikembalikan")
                                                    <a href="/administrator/peminjaman/{{ $b->id }}/return"
                                                            class="btn btn-primary btn-sm text-capitalize font-weight-normal" data-toggle="modal" data-target="#pinjamModal">Return
                                                        </a>
                                                @endif
                                                <form action="/administrator/peminjaman/{{ $b->id }}/delete"
                                                    method="POST">
                                                    @csrf
                                                    @method('delete')
                                                    <button type="submit"
                                                        onclick="return confirm('Yakin ingin menghapus Data?')"
                                                        href="/administrator/peminjaman/{{ $b->id }}/delete"
                                                        class="ml-1 btn btn-danger btn-sm text-capitalize font-weight-normal">Hapus</button>
                                                </form>
                                                </td>
                                                <td>
                                                    {{$b->civitas->nama}} 
                                                    {{-- $b->nama --}}
                                                </td>
                                                <td>
                                                    {{ $b->buku->judul }}
                                                    {{-- $b->judul --}}
                                                </td>
                                                <td>
                                                    {{ $b->user->name }}
                                                    {{-- $b->name --}}
                                                </td>
                                                <td>
                                                    {{ $b->status }}
                                                </td>
                                                <td class="text-center">
                                                    <span id="printable{{ $nomor }}"><img
                                                            src="data:image/png;base64,{{ DNS1D::getBarcodePNG($b->id, 'C93') }}"
                                                            alt="barcode" />
                                                    </span>
                                                    <input type="button" class="btn btn-danger btn-fab p-2"
                                                        onclick="printDiv(`printable{{ $nomor }}`)" value="Print">
                                                </td>
                                            </tr>
                                            @php
                                                $nomor++;
                                            @endphp
                                            <div class="modal fade modal-show-custom" id="pinjamModal" tabindex="-1" role="dialog"
            aria-labelledby="pinjamModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" style="border-radius: 20px;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="pinjamModalLabel">Scan Barcode</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <div class="row ml-lg-5 ml-md-0">
                            <form action="/administrator/peminjaman/return" method="post">
                            @csrf
                            <input type="text" value="" name="id_pinjam" class="mt-n1" style="height:40px;">
                            <button type="submit" class="btn btn-primary btn-sm text-capitalize font-weight-normal mt-n1 ml-3" style="height:40px;">Return
                            </button>
                            </div>
                            </form>
                        </div>
                    
                </div>
                                        @endforeach
                                    @endif
                                </tbody>
                            </table>
                            <div class="d-flex justify-content-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            console.log(printContents);
            window.print();

            document.body.innerHTML = originalContents;
        }

    </script>
@endsection
