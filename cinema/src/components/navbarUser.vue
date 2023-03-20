<template>

  <section id="topbar" class="d-flex align-items-center">
    <div
      class="container d-flex justify-content-center justify-content-md-between"
    >
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope-fill"></i
        ><a href="mailto:contact@example.com">youcode@gmail.com</a>
        <i class="bi bi-phone-fill phone-icon"></i> 0612344312
      </div>
      <div class="social-links d-none d-md-block">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>
    </div>
  </section>

  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo">
        <a><img src="assets/img/water-logo-splash-png.webp" alt="" />Cinet</a>
      </h1>

      <nav id="navbar" class="navbar">
        <ul>
          <router-link to="/film"
            ><li><a class="nav-link">Film liste</a></li></router-link
          >
          <router-link to="/reserv"
            ><li><a class="nav-link">Reservation</a></li></router-link
          >
          <router-link to="/"
            ><li>
              <a class="nav-link" @click="logout()">Log out</a>
            </li></router-link
          >
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
    </div>
  </header>
</template> 
  <script>
export default {
  name: "navbarUser",
  methods: {
    logout() {
      localStorage.clear();
    },
  },
};
</script>
