<template>
    <div class="mainBody">
        <div class="w3-top w3-bar w3-white w3-wide w3-padding w3-card">
            <a v-on:click="toMainPage" class="w3-half w3-bar-item w3-button">
                <img class="logo w3-image" src="./assets/images/pick/logo.jpg" alt="logo">
            </a>
            <!-- Float links to the right. Hide them on small screens -->
            <div class="w3-half w3-right " id="navbarItem">
                <a v-on:click='toElement(" #showCase")' class="w3-bar-item w3-button"><b>Showcase</b></a>
                <a v-on:click='toElement(" #about")' class="w3-bar-item w3-button"><b>About</b></a>
                <a v-on:click='toElement(" #contact")' class=" w3-bar-item w3-button"><b>Contact</b></a>
            </div>
        </div>
        <!-- Header -->
        <header v-show="!showSlideImg" class="w3-display-container w3-content w3-wide w3-margin-top" style="max-width:1500px;" id="home">
            <img class="w3-image w3-animate-zoom" src="./assets/images/pick/b.jpg" alt="Architecture" width="1500" height="800" id="homeImg">
        </header>
        <slideImg v-show="showSlideImg" v-bind:imgData="imgData" v-show="showSlideImg" id="slideImg"> </slideImg>

        <!-- Page content -->
        <div class="w3-content w3-padding" style="max-width:1564px">

            <!-- Project Section -->
            <div class="showCase w3-container w3-padding-32" id="showCase">
                <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Showcase</h3>
            </div>
            <div class="w3-section">
                <button v-on:click='ashowSlideImg(index)' v-for="(item, index) in bArrays" v-bind:class="{ 'w3-black': index%2==0 }" class="w3-large w3-button w3-block "><b>{{item}}</b></button>
            </div>
            <!-- About Section -->
            <div class="about w3-content" style="max-width:700px" id="about">
                <h5 class="w3-center w3-padding-64">
                    <span class="w3-tag w3-wide">ABOUT US</span>
                </h5>
                <p>The Cafe was founded in blabla by Mr. Smith in lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <p>In addition to our full espresso and brew bar menu, we serve fresh made-to-order breakfast and lunch sandwiches, as well as a selection of sides and salads and other good stuff.</p>
                <div class="w3-panel w3-leftbar w3-light-grey">
                    <p>
                        <i>"Use products from nature for what it's worth - but never too early, nor too late." Fresh is the new sweet.</i>
                    </p>
                    <p>Chef, Coffeeist and Owner: Liam Brown</p>
                </div>
            </div>

            <!-- Contact Section -->
            <div class="w3-container w3-padding-32" id="contact">
                <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
                <p>Lets get in touch and talk about your next project.</p>
                <form action="/action_page.php" target="_blank">
                    <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
                    <input class="w3-input w3-section w3-border" type="text" placeholder="Email" required name="Email">
                    <input class="w3-input w3-section w3-border" type="text" placeholder="Subject" required name="Subject">
                    <input class="w3-input w3-section w3-border" type="text" placeholder="Comment" required name="Comment">
                    <button class="w3-button w3-black w3-section" type="submit">
                        <i class="fa fa-paper-plane"></i> SEND MESSAGE
                    </button>
                </form>
            </div>

            <!-- End page content -->
        </div>

        <!-- Footer -->
        <footer class="w3-padding-20 w3-light-grey w3-small w3-center" id="footer">
            <div class="w3-row-padding">
                <h4>Store</h4>
                <p>
                    <i class="fa fa-fw fa-map-marker"></i> Company Name</p>
                <p>
                    <i class="fa fa-fw fa-phone"></i> 0044123123</p>
                <p>
                    <i class="fa fa-fw fa-envelope"></i> ex@mail.com</p>
                <br>
            </div>
        </footer>
    </div>
</template>

<script type="text/javascript">
import slideImg from "../head/slideImg";
export default {
  template: template,
  data() {
    return {
      imgData: [],
      showSlideImg: false,
      slideIndex: 1,
      bArrays: [
        "Hexalobular",
        "Anti-dismantle",
        "Propeller",
        "triplegram",
        "Shield",
        "Steed",
        "Bull"
      ],
      arrays: [
        ["Hexalobular1", "Hexalobular2", "Hexalobular3", "Hexalobular4"],
        ["Anti-dismantle1", "Anti-dismantle2", "Anti-dismantle3"],
        [
          "Propeller1",
          "Propeller2",
          "Propeller3",
          "Propeller4",
          "Propeller5",
          "Propeller6"
        ],
        [
          "triplegram1",
          "triplegram2",
          "triplegram3",
          "triplegram4",
          "triplegram5"
        ],
        ["Shield1", "Shield2", "Shield3", "Shield4"],
        ["Steed1", "Steed2", "Steed3", "Steed4"],
        ["Bull"]
      ],
      modalUrl: "",
      isActive: true
    };
  },
  methods: {
    toElement(data) {
      var height = $(data).offset().top; // y軸
      var $htmlBody = $("html, body");
      $htmlBody.animate(
        {
          scrollTop: height - 40
        },
        600
      );
    },
    toMainPage() {
      this.showSlideImg = false;
      this.scrollToTop();
    },
    ashowSlideImg(index) {
      this.imgData = this.arrays[index];
      this.showSlideImg = true;
      this.scrollToTop();
    },
    scrollToTop() {
      var body = $("html, body");
      body.stop().animate({ scrollTop: 0 }, 500);
    },
    showImgModal(id) {
      //this.$router.push({ name: 'companyInfo'})
      document.getElementById("modal01").style.display = "block";
      this.modalUrl = "./assets/images/pick/" + id + ".JPG";
    },
    plusDivs(n) {
      this.showDivs((this.slideIndex += n));
    },
    showDivs(n) {
      this.showDivs(this.slideIndex);
      var i;
      let x = document.getElementsByClassName("mySlides");
      if (n > x.length) {
        this.slideIndex = 1;
      }
      if (n < 1) {
        this.slideIndex = x.length;
      }
      for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
      }
      x[this.slideIndex - 1].style.display = "block";
    }
  },
  created: function() {
    //document.getElementById("myBtn").click();
    this.imgData = this.arrays[0];
  },
  mounted() {},
  components: { slideImg }
};
</script>
<style >
.mainBody .logo {
  width: 307px;
  height: 273px;
  margin-top: -99px;
  margin-left: -80px;
  margin-bottom: -150px;
}

.mainBody #homeImg {
  margin-top: 77px;
}
.mainBody #slideImg {
  margin-top: 92px;
}
.mainBody #navbarItem {
  font-size: 10px;
}
</style>