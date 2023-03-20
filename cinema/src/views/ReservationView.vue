<template>
  <NavbarUser />
  <section id="hero" class="d-flex align-items-center">
    <div
      class="container position-relative"
      data-aos="fade-up"
      data-aos-delay="500"
    >
      <h1>Welcome to Cinet</h1>
      <h2>We are Here helped you taking your ticket</h2>
      <a href="#about" class="btn-get-started scrollto">Wellcome</a>
    </div>
  </section>

  <!-- <div class="container">
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
        
        </div> -->
  <main id="main">
    <section id="why-us" class="why-us">
      <div class="container">
        <div class="row">
         
            <div
              class="col"
              v-for="reserv in reservation"
              :key="reserv.id_reservation"
            >
            <div class="box">
              <a
                class="btn btn-close"
                @click="cancel(reserv.id_reservation, reserv.id_film)"
              ></a>
              
              <span>{{ reserv.film_name}}</span>
              <span>Numero du place:{{ reserv.id_reservation}}</span>
              <span>salle:{{ reserv.salle}}</span>
              <i class="fa-solid fa-couch fs-3"></i>
              </div>
            </div>
          </div></div>
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
                A108 Adam Street <br />
                Safi 535022, Ma<br /><br />
                <strong>Phone:</strong> +1 5589 55488 55<br />
                <strong>Email:</strong> youcode@gmail.com<br />
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"
                  ><i class="bx bxl-instagram"></i
                ></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li>
                <i class="bx bx-chevron-right"></i> <a href="#">About us</a>
              </li>
              <li>
                <i class="bx bx-chevron-right"></i> <a href="#">Services</a>
              </li>
              <li>
                <i class="bx bx-chevron-right"></i>
                <a href="#">Terms of service</a>
              </li>
              <li>
                <i class="bx bx-chevron-right"></i>
                <a href="#">Privacy policy</a>
              </li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Location</h4>
            <p>
              Tamen quem nulla quae legam multos aute sint culpa legam noster
              magna
            </p>
            <form action="" method="post">
              <input type="email" name="email" /><input
                type="submit"
                value="Subscribe"
              />
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Cinet</span></strong
        >. All Rights Reserved
      </div>
    </div>
  </footer>
</template>
<script>
import NavbarUser from "@/components/navbarUser.vue";
import axios from "axios";
import Navbar from "@/components/navbar.vue";
export default {
  name: "ReservationView",

  data() {
    return {
      reservation: "",
      user_id: localStorage.getItem("user_id"),
      // id_reservation: "",
      // id_film: ""
    };
  },
  components: {
    NavbarUser,
    Navbar,
  },
  methods: {
    cancel(id_reservation, id_film) {
        console.log(id_reservation)
      // let fd = new FormData();
      // fd.append('id_reservation' , this.id_reservation);
      // fd.append('id_film' , this.id_film);
      axios({
        method: "get",
        url:
          "http://localhost/server/Cenima/Reservations/deleteReservation?id_reservation=" +
          id_reservation +
          "&id_film=" +
          id_film,
      }).then((res) => {
        window.location.href = '/reserv';
        console.log(res.data);
      });
    },
    getReservation: function () {
      var data = new FormData();
      data.append("user_id", this.user_id);
      axios
        .post(
          "http://localhost/server/Cenima/Reservations/getMyreservation",
          data
        )
        .then((res) => {
          this.reservation = res.data;
        });
    },
  },

  mounted() {
    this.getReservation();
  },
};
</script>