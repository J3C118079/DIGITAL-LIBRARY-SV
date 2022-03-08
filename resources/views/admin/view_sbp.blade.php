@extends('admin.layouts.master')
@section('title', 'Admin - Viw Surat Bebas Pustaka')
@section('content')
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <a href="/administrator/sbp/view/export_excel" role="button" class="btn btn-success btn-fab p-2">Export</a>
                        <div class="table-responsive">
                            <table class="table">
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
                                </thead>
                                <tbody>
                                @if (!$sbp->count())
                                    <tr>
                                        <td colspan="2" class="text-center"><i>Data request kosong</i></td>
                                    </tr>
                                @else
                                    @foreach ($sbp as $b)
                                        <tr>
                                            <td>
                                                <form action="/administrator/sbp/view/{{ $b->id }}/delete"
                                                    method="POST">
                                                    @csrf
                                                    @method('delete')
                                                    <button type="submit"
                                                        onclick="return confirm('Yakin ingin menghapus Data?')"
                                                        href="/administrator/sbp/view/{{ $b->id }}/delete"
                                                        class="ml-1 btn btn-danger btn-sm text-capitalize font-weight-normal">Hapus</button>
                                                </form>
                                            </td>
                                            <td>
                                                {{ $b->requester }}
                                            </td>
                                            <td>
                                                {{ $b->user->nim }}
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection