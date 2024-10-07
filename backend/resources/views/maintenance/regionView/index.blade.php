@extends('admin')

@section('content')
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Maintenance</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Maintenance</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    @if ($message = Session::get('success'))
        <p style="color: green;">{{ $message }}</p>
    @endif
    <div class="row">
        <div class="col-lg-12">
            <div class="table-responsive p-3">
                <table class="table align-items-center table-flush" id="dataTable">
                    <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>Région</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($region as $region)
                            <tr>
                                <td>{{ $region->id }}</td>
                                <td>{{ $region->libRegion }}</td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="Actions">
                                        <a href="{{ route('region.show', $region->id) }}" class="btn btn-sm btn-primary"
                                            title="Modifier"><i class="bi bi-pencil"></i></a>
                                        <form action="{{ route('region.destroy', $region->id) }}" method="POST"
                                            class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" title="Supprimer"
                                                onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette Région ?')"><i
                                                    class="bi bi-trash"></i></button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>

                </table>
                <a href="{{ url()->previous() }}" class="btn btn-secondary mt-3">Retour</a>
</div>
            </div>
        </div>
    </div>
    
@endsection