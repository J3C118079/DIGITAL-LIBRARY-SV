    <div class="sidebar" data-color="white" data-active-color="danger">
        <div class="logo">
            <a href="/administrator" class="simple-text logo-mini">
                <div class="logo-image-small">
                    <img src="{{ asset('images/logo.svg') }}">
                </div>
                <!-- <p>CT</p> -->
            </a>
            <a href="/administrator" class="simple-text logo-normal">
                Maca
            </a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="{{ request()->is('administrator') ? ' active' : '' }}">
                    <a href="/administrator">
                        <i class="nc-icon nc-bank"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="{{ request()->is('administrator/buku*') ? ' active' : '' }}">
                    <a href="/administrator/buku">
                        <i class="nc-icon nc-book-bookmark"></i>
                        <p>Buku</p>
                    </a>
                </li>
                <li class="{{ request()->is('administrator/ebook*') ? ' active' : '' }}">
                    <a href="/administrator/ebook">
                        <i class="nc-icon nc-tv-2"></i>
                        <p>Ebook</p>
                    </a>
                </li>
                <li class="{{ request()->is('administrator/jurnal*') ? ' active' : '' }}">
                    <a href="/administrator/jurnal">
                        <i class="nc-icon nc-send"></i>
                        <p>Jurnal</p>
                    </a>
                </li>
                <li class="{{ request()->is('administrator/sbp*') ? ' active' : '' }}">
                    <a data-toggle="collapse" href="#sbp" role="button" aria-expanded="false" aria-controls="user">
                        <i class="nc-icon nc-email-85"></i>
                        <p>Bebas Pustaka<span class="badge badge-warning badgeUser"></span></p>
                    </a>
                    <div class="collapse" id="sbp">
                        <ul class="nav ml-3">
                            <li>
                                <a href="/administrator/sbp">
                                    <i class="nc-icon nc-email-85"></i>
                                    <p>Request SBP</p></span>
                                </a>
                            </li>
                            <li>
                                <a href="/administrator/sbp/view">
                                    <i class="nc-icon nc-email-85"></i>
                                    <p>Lihat SBP</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="{{ request()->is('administrator/peminjaman*') ? ' active' : '' }}">
                    <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                        aria-controls="collapseExample">
                        <i class="nc-icon nc-bullet-list-67"></i>
                        Peminjaman <span class="badge badge-warning" id="badge"></span>
                    </a>
                    <div class="collapse" id="collapseExample">
                        <ul class="nav ml-3">
                            <li class="{{ request()->is('administrator/peminjaman/request') ? ' active' : '' }}">
                                <a href="/administrator/peminjaman/request">
                                    <i class="nc-icon nc-planet"></i>
                                    <p>Request Pinjam</p> <span class="badge badge-warning" id="badge"></span>
                                </a>
                            </li>
                            <li class="{{ request()->is('administrator/peminjaman') ? ' active' : '' }}">
                                <a href="/administrator/peminjaman">
                                    <i class="nc-icon nc-planet"></i>
                                    <p>Data Pinjam</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="{{ request()->is('administrator/user*') ? ' active' : '' }}">
                    <a data-toggle="collapse" href="#user" role="button" aria-expanded="false" aria-controls="user">
                        <i class="nc-icon nc-bulb-63"></i>
                        <p>User <span class="badge badge-warning badgeUser"></span></p>
                    </a>
                    <div class="collapse" id="user">
                        <ul class="nav ml-3">
                            <li class="{{ request()->is('administrator/user') ? ' active' : '' }}">
                                <a href="/administrator/user">
                                    <i class="nc-icon nc-basket"></i>
                                    <p>Manajemen User</p></span>
                                </a>
                            </li>
                            <li class="{{ request()->is('administrator/user/registrasi') ? ' active' : '' }}">
                                <a href="/administrator/user/registrasi">
                                    <i class="nc-icon nc-basket"></i>
                                    <p>Registrasi User <span class="badge badge-warning badgeUser"></span></p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="{{ request()->is('administrator/bantuan*') ? ' active' : '' }}">
                    <a href="/administrator/bantuan">
                        <i class="nc-icon nc-paper"></i>
                        <p>Bantuan</p>
                    </a>
                </li>
                <li>
                    <a href="/administrator/report">
                        <p>REPORT</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <style>

    </style>

    @section('script')
        <script>
            let xhr = new XMLHttpRequest();

            xhr.open('GET', 'http://localhost:8000/administrator/countPinjam', true);
            xhr.onload = function() {
                if (this.status == 200) {
                    let count = JSON.parse(this.responseText);
                    // console.log(count.data);
                    count.data > 0 ? document.querySelector('#badge').innerHTML = count.data : '';
                }
            }
            xhr.send();

            console.log('mantab');

        </script>

        {{-- COUNT USER --}}
        <script>
            // fetch('{{ url('/administrator/countUser') }}').then(response => response.json()).then(data => console.log(
            //     data));

            // async fetch
            $(document).ready(function() {
                async function getUserData() {
                    const response = await fetch("{{ url('/administrator/countUser') }}");
                    const data = await response.json()
                    data.data > 0 ? $(".badgeUser").html(data.data) : "";
                }
                getUserData();
            })

        </script>

    @endsection
