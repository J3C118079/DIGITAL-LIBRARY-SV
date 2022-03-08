@extends('admin.layouts.master')
@section('title', 'Report Denda')
@section('content')
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class=" text-primary">
                                <th>
                                    Nama
                                </th>
                                <th>
                                    NIM
                                </th>
                                <th>
                                    Buku
                                </th>
                                <th>
                                    Status
                                </th>
                                </thead>
                                <tbody>
                                @if (!$user->count())
                                    <tr>
                                        <td colspan="3" class="text-center"><i>Data report kosong</i></td>
                                    </tr>
                                @else
                                    @foreach ($user as $b)
                                        <tr>
                                            <td>
                                                {{ $b->name }}
                                            </td>
                                            <td>
                                                {{ $b->nim }}
                                            </td>
                                            <td>
                                                {{ $b->judul }}
                                            </td>
                                            <td>
                                                {{ $b->status }}
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