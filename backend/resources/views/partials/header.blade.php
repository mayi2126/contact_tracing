<nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
    <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>
    <ul class="navbar-nav ml-auto">

        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-1 small"
                            placeholder="What do you want to look for?" aria-label="Search"
                            aria-describedby="basic-addon2" style="border-color: #3f51b5;">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger badge-counter">3+</span>
            </a>
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                    Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                        <div class="icon-circle bg-primary">
                            <i class="fas fa-file-alt text-white"></i>
                        </div>
                    </div>
                    <div>
                        <div class="small text-gray-500">December 12, 2019</div>
                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                    </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                        <div class="icon-circle bg-success">
                            <i class="fas fa-donate text-white"></i>
                        </div>
                    </div>
                    <div>
                        <div class="small text-gray-500">December 7, 2019</div>
                        $290.29 has been deposited into your account!
                    </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                        <div class="icon-circle bg-warning">
                            <i class="fas fa-exclamation-triangle text-white"></i>
                        </div>
                    </div>
                    <div>
                        <div class="small text-gray-500">December 2, 2019</div>
                        Spending Alert: We've noticed unusually high spending for your account.
                    </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <span class="badge badge-warning badge-counter">2</span>
            </a>
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                    Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="{{ asset('img/logo/logo4.png') }}" style="max-width: 60px"
                            alt="">
                        <div class="status-indicator bg-success"></div>
                    </div>
                    <div class="font-weight-bold">
                        <div class="text-truncate">Veuillez enrégistrer les retraits des résultats svp!!!
                            pour chaque retrait enrégistré le bouton du champs état passe au vert...</div>
                        <div class="small text-gray-500">charge virale</div>
                    </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="{{ asset('img/drapeautogo.png') }}" style="max-width: 60px"
                            alt="">
                        <div class="status-indicator bg-default"></div>
                    </div>

                    <div>
                        <div class="text-truncate">Veuillez enrégistrer les retraits des résultats svp!!!
                            pour chaque retrait enrégistré le bouton du champs état passe au vert...</div>
                        <div class="small text-gray-500">charge virale</div>
                    </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-tasks fa-fw"></i>
                <span class="badge badge-success badge-counter">3</span>
            </a>
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                    Task
                </h6>
                <a class="dropdown-item align-items-center" href="#">
                    <div class="mb-3">
                        <div class="small text-gray-500">Design Button
                            <div class="small float-right"><b>50%</b></div>
                        </div>
                        <div class="progress" style="height: 12px;">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 50%"
                                aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </a>
                <a class="dropdown-item align-items-center" href="#">
                    <div class="mb-3">
                        <div class="small text-gray-500">Make Beautiful Transitions
                            <div class="small float-right"><b>30%</b></div>
                        </div>
                        <div class="progress" style="height: 12px;">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: 30%"
                                aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </a>
                <a class="dropdown-item align-items-center" href="#">
                    <div class="mb-3">
                        <div class="small text-gray-500">Create Pie Chart
                            <div class="small float-right"><b>75%</b></div>
                        </div>
                        <div class="progress" style="height: 12px;">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 75%"
                                aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">View All Taks</a>
            </div>
        </li>

        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="img-profile rounded-circle" src="{{ asset('img/drapeautogo.png') }}"
                    style="max-width: 30px; height: 30px; margin-right: 8px;">
                <span class="ml-2 d-none d-lg-inline text-white small">{{ Auth::user()->name }}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a href="{{ route('changePassword') }}" class="dropdown-item align-items-center">
                    <i class="fas fa-user-edit fa-sm fa-fw mx-2 text-gray-400"></i>
                    Changer le mot de passe
                </a>
                @if (Auth::user()->profil->libProfile === 'TECHNICIEN DE LABO' ||
                        Auth::user()->profil->libProfile === 'SUPERVISEUR DE LABO')
                    <a href="{{ route('signature') }}" class="dropdown-item align-items-center">
                        <i class="fas fa-user-edit fa-sm fa-fw mx-2 text-gray-400"></i>
                        Signature Automatique
                    </a>
                @endif
                <div class="dropdown-divider"></div>
                <a href="{{ route('logout') }}" class="dropdown-item"
                    onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mx-2 text-gray-400"></i>
                    Deconnexion
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
            </div>
        </li>

    </ul>
</nav>
