@extends('admin')

@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif


    <!-- tableau de bord -->
       @include('layouts.tableauBord')
    <!-- tableau de bord -->
@endsection
