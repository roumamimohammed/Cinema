<template>
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

  <main id="main">
    <section id="why-us" class="why-us">
      <div class="box activeKrsi">
        <div class="container">
          <div class="row">
            <div class="col-lg-6" data-aos="fade-up">
              <a href="">
                <div class="box">
                  <span>{{ film.film_name }}</span>
                  <img
                    style="width: 100%; height: 50%"
                    :src="'assets/img/' + film.image"
                    alt=""
                  />
                </div>
              </a>
            </div>
            <div class="col-lg-6" data-aos="fade-up">
              <div class="box">
                <span style="color: white">Description</span>
                <p>
                  +18 <br />
                  Director:jack fino<br />Actors:ana will - mily john- rio
                  valino<br />
                  A film about world war 2<br />who discriped the violance<br />
                  choose your seet
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="flex">
          <button
            class="btn"
            v-for="seed in film.salle_place"
            :id="'seed' + seed"
            :key="seed"
            @click="tet(seed, film.id_film, p, film.prix)">
         
            <div class="box">
              <i class="fa-solid fa-couch fs-3"></i>
            </div>
          </button>
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
import axios from "axios";


export default {
  name: "ShowView",
  data() {
    return {
      film: "",
      user_id: localStorage.getItem("user_id"),
    };
    
  },
  props: {
    id: {
      type: BigInt,
      default: null,
    },
  },
  methods: {
    tet(seed, id_film, salle_place, prix) {
      if (
        document.getElementById("seed" + seed).classList.contains("activeKrsi")
      ) {
        
        this.$swal({
              title: 'Are you sure?',
              text: "'Go to reservation page to delete your reservation'",
              type: 'warning',
              confirmButtonColor: '#3085d6',
              confirmButtonText: 'Ok'
            });}
    
      else {
      //   var data = new FormData();
      // data.append("user_id", this.user_id);
      // axios
      //   .post(
      //     "http://localhost/server/Cenima/Reservations/getMyreservation",
      //     data
      //   )
      //   .then((res) => {
      //     this.reservation = res.data;
      //   });
        document.getElementById("seed" + seed).classList.add("activeKrsi");
        axios({
          method: "get",
          url:
            "http://localhost/server/Cenima/Reservations/reserver?id_film=" +
            id_film +
            "&nbr_place=" +
            1 +
            "&prix=" +
            prix
            +"&user_id=" +
            this.user_id,
        });
      }
    },
    getFilm: function () {
      axios({
        method: "get",
        url: "http://localhost/server/Cenima/Films/getfilm?id_film=" + this.id,
      })
        .then((res) => (this.film = res.data[0]))
        .catch((err) => console.error(err));
    },
    // , reserver: function () {
    //   axios({
    //     method: "get",
    //     url: "http://localhost/server/Cenima/Reservations/reserver?id_film=" + this.id+"&nbr_place="+this.nbr_place+"&prix="+this.prix,
    //   })
    // }
  },

  created() {
    console.log(this.film);
  },
  mounted() {
    this.getFilm();
  },
};
</script>