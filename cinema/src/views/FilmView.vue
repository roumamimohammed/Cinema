<template>
    <NavbarUser/>
     <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative" data-aos="fade-up" data-aos-delay="500">
      <h1>Welcome to our client</h1>
      <h2>We are Here helped you taking your ticket </h2>
      <a href="#about" class="btn-get-started scrollto">Wellcome</a>
    </div>
  </section>

  <main id="main">
    <section id="why-us" class="why-us">
        <div class="flex justify-end mb-10 mr-10">
        <input style="width: 20%;" type="date" :min=ab @change="getFilms" v-model="currentDate" class="form-control" placeholder="John" required>
    </div>
    
      <div class="container">
          <div class="row">
          
          <div v-for="film in films" :key="film.id_film" class="col">
            
        <div class="box" >
            <router-link :to="'/show?id_film='+film.id_film">
              <span  >{{ film.film_name }}</span> <br>
              <span  >Salle:{{ film.salle }}</span> <br>
              <img style="width: 50%;height: 80%; border-radius: 30px;"   :src="'assets/img/'+film.image" alt="">    
            </router-link>
          </div>
        </div>
            </div>
        
        </div>
     

    </section>
</main>
   

  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="footer-info">
              <h3>Cinet</h3>
              <p>
                A108 Adam Street <br>
                Safi 535022, Ma<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> youcode@gmail.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>


          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Location</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Cinet</span></strong>. All Rights Reserved
      </div>
      
    </div>
  </footer>
</template>
<script>

import NavbarUser from '@/components/navbarUser.vue'
import axios from 'axios'
import Navbar from '@/components/navbar.vue';
  export default {
    
    name: 'FilmView',
 
    data() {
      return {
        currentDate : new Date().toJSON().slice(0, 10),
        ab : new Date().toJSON().slice(0, 10),
        films: "",
        user_id: localStorage.getItem('user_id')
      };
    },
    components: {
    NavbarUser,
        Navbar,
  },
    methods: {
      getFilms:function(){
                var d = new Date(this.currentDate);
                var dayName = d.getDay();
                if(dayName==0){
                    this.$swal.fire(
                    
                    'les films ne sont pas disponible le dimanche !',
                    )
                    this.currentDate = new Date().toJSON().slice(0, 10);
                }
                else{
                    var data=new FormData();
                    data.append('show_date',this.currentDate);
                    axios.post("http://localhost/server/Cenima/Films/getfilmsbydate",data)
                    .then((res)=>{
                        this.films=res.data;
                    });
                }
            }, 
    },
    mounted(){
      this.getFilms();
    }
  };

</script>