@extends('admin')

@section('content')

<link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">

<div id="wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Maintenance</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Maintenance</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

	<div class="card-header">
       
	<ul class="nav nav-tabs" role="tablist">
	<li class="nav-item">
		<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Région</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">District</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Commune</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">Formation sanitaire</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">Village</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Quartier</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">Thème</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-8" role="tab">Profils</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-9" role="tab">Motifs</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#tabs-10" role="tab">Professions</a>
	</li>
</ul><!-- Tab panes -->

<div class="tab-content">
	<div class="tab-pane active" id="tabs-1" role="tabpanel">
  	    @include('maintenance.regionView.create')
	</div>

	<div class="tab-pane" id="tabs-2" role="tabpanel">
       	@include('maintenance.districtView.create')
	</div>

	<div class="tab-pane" id="tabs-3" role="tabpanel">
	      @include('maintenance.communeView.create')
	</div>

	<div class="tab-pane" id="tabs-4" role="tabpanel">
	      @include('maintenance.formationsanitaire.create')
	</div>

	<div class="tab-pane" id="tabs-5" role="tabpanel">
	      @include('maintenance.villageView.create')
	</div>

	<div class="tab-pane" id="tabs-6" role="tabpanel">
	      @include('maintenance.quartierView.create')
	</div>
	<div class="tab-pane" id="tabs-7" role="tabpanel">
	      @include('maintenance.themeView.create')
	</div>
	<div class="tab-pane" id="tabs-8" role="tabpanel">
	      @include('maintenance.profil.create')
	</div>
	<div class="tab-pane" id="tabs-9" role="tabpanel">
	      @include('maintenance.motifView.create')
	</div>

	<div class="tab-pane" id="tabs-10" role="tabpanel">
	      @include('maintenance.professionView.create')
	</div>

</div>
</div>

	</div>
    

<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

@endsection
