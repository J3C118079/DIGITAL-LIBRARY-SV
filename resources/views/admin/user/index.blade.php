@extends('admin.layouts.master')
@section('title', 'Admin - User')
@section('datatableCSS')
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

@endsection
@section('content')
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                @include('admin.layouts.alert')
                <div class="card">
                    <div class="card-body">
                        <p>Cari Data User :</p>
                        <form action="/administrator/user" method="GET">
                            <input type="text" name="cari" style="outline: none;"
                                class="px-2 py-2 rounded border border-info" placeholder="Cari .."
                                value="{{ old('cari') }}">
                            <button type="submit" class="ml-1 btn btn-primary btn-fab btn-icon btn-round"><i
                                    class="nc-icon nc-zoom-split"></i></button>
                        </form>
                        <div class="table-responsive">
                            <table class="table" id="myTable">
                                <thead class=" text-primary">
                                    <th>
                                        Aksi
                                    </th>
                                    <th>
                                        Nama
                                    </th>
                                    <th>
                                        NIM
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Title
                                    </th>
                                </thead>
                                <tbody>
                                    @if (!$user->count())
                                        <tr>
                                            <td colspan="5" class="text-center"><i>Data user kosong</i></td>
                                        </tr>
                                    @else
                                        @foreach ($user as $b)
                                            <tr>
                                                <td>
                                                    <span class="d-inline-flex">
                                                        <a href="/administrator/user/{{ $b->id }}/edit"
                                                            class="btn btn-primary btn-sm text-capitalize font-weight-normal">Edit
                                                        </a>
                                                        <form action="/administrator/user/{{ $b->id }}/delete"
                                                            method="POST">
                                                            @csrf
                                                            @method('delete')
                                                            <button type="submit"
                                                                onclick="return confirm('Yakin ingin menghapus user?')"
                                                                href="/administrator/user/{{ $b->id }}/delete"
                                                                class="ml-1 btn btn-danger btn-sm text-capitalize font-weight-normal">Hapus</button>
                                                        </form>
                                                    </span>
                                                </td>
                                                <td>
                                                    {{ $b->name }}
                                                </td>
                                                <td>
                                                    {{ $b->nim }}
                                                </td>
                                                <td>
                                                    {{ $b->email }}
                                                </td>
                                                <td>
                                                    {{ $b->civitas->nama }}
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endif
                                </tbody>
                            </table>
                            <div class="d-flex justify-content-center">
                                {{ $user->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready( function () {
            $.noConflict();
    $('#myTable').DataTable({
        "searching": false,
        "info": false,
        "lengthChange": false,
        "paging": false,
        "columnDefs": [
{ "orderable": false, "targets": 0 }
]
    });
} );
    </script>
@endsection
