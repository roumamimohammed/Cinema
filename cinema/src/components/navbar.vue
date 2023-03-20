<template>
   

  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope-fill"></i><a href="mailto:contact@example.com">youcode@gmail.com</a>
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

      <h1 class="logo"><a><img src="assets/img/water-logo-splash-png.webp" alt="">Cinet</a></h1>
     
      <nav id="navbar" :class="{'navbar-mobile' : shown,'navbar':!shown}">
        <ul>
          <router-link to="/"><li><a class="nav-link scrollto ">Home</a></li></router-link>
          <router-link to="/signin"><li><a class="nav-link scrollto ">Sing in</a></li></router-link>
          <router-link to="/signuo"><li><a class="nav-link scrollto ">Sing up</a></li></router-link>
        </ul>
        <i class="bi mobile-nav-toggle" :class="{'bi-x' : shown,'bi-list':!shown}" @click="()=>{ shown = !shown}"></i>
      </nav>
    </div>
  </header>
</template>

<script>
export default {
    name : 'navbar',
    data(){
      return {
        shown :false
      }
    }
}
</script>