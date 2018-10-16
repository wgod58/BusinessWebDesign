<template>
    <div class="mainBody">
        <div class="w3-top w3-bar w3-white w3-wide w3-padding w3-card">
            <a href="#home" class="w3-bar-item w3-button"><b>AMD</b></a>
            <!-- Float links to the right. Hide them on small screens -->
            <div class="w3-right ">
                <a href="#projects" class="w3-bar-item w3-button">Showcase</a>
                <a href="#about" class="w3-bar-item w3-button">About</a>
                <a href="#contact" class="w3-hide-small w3-bar-item w3-button">Contact</a>
            </div>
        </div>
        <br>
        <!-- Header -->
        <header v-show="!showSlideImg" class="w3-display-container w3-content w3-wide w3-margin-top" style="max-width:1500px;" id="home">
            <img class="w3-image w3-animate-zoom" src="./assets/images/pick/b.jpg" alt="Architecture" width="1500" height="800">
        </header>
        <slideImg v-bind:imgData="imgData" v-show="showSlideImg"> </slideImg>

        <!-- Page content -->
        <div class="w3-content w3-padding" style="max-width:1564px">

            <!-- Project Section -->
            <div class="w3-container w3-padding-32" id="projects">
                <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Showcase</h3>
            </div>
            <div class="w3-section">
                <button v-on:click='ashowSlideImg()' v-for="(item, index) in bArrays" v-bind:class="{ 'w3-black': index%2==0 }" class="w3-large w3-button w3-block "><b>{{item}}</b></button>
            </div>
            <!-- <div class="w3-container">
                <div class="w3-content w3-display-container">

                    <div class="w3-display-container mySlides">
                        <img src="./assets/images/pick/Anti-dismantle1.JPG" style="width:100%">

                    </div>

                    <div class="w3-display-container mySlides">
                        <img src="./assets/images/pick/Anti-dismantle2.JPG" style="width:100%">

                    </div>

                    <button class="w3-button w3-display-left w3-black" v-on:click="plusDivs(-1)">&#10094;</button>
                    <button class="w3-button w3-display-right w3-black" v-on:click="plusDivs(1)">&#10095;</button>

                </div>
            </div>-->
            <!--
            <div id="modal01" class="w3-modal" onclick="this.style.display='none'">

                <div class="w3-content w3-display-container">

                    <div class="w3-display-container mySlides">
                        <img src="./assets/images/pick/Anti-dismantle1.JPG" style="width:100%">

                    </div>

                    <div class="w3-display-container mySlides">
                        <img src="./assets/images/pick/Anti-dismantle2.JPG" style="width:100%">

                    </div>

                    <button class="w3-button w3-display-left w3-black" v-on:click="plusDivs(-1)">&#10094;</button>
                    <button class="w3-button w3-display-right w3-black" v-on:click="plusDivs(1)">&#10095;</button>

                </div>
            </div>-->
            <!--<div v-for="array in arrays" class="w3-row-padding">
        <div v-for="object in array" class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-display-container">
            <div class="w3-display-topleft w3-black w3-padding">{{object.name}}</div>
            <img v-on:click='showImgModal(object.id)' v-bind:src='"./assets/images/pick/" +object.id+".JPG"' alt="Screw" style="width:100%">
          </div>
        </div>
      </div>
      <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
        <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
        <div class="w3-modal-content w3-animate-zoom">
          <img v-bind:src="modalUrl" style="width:100%">
        </div>
      </div>-->
            <!-- About Section -->
            <div class="w3-content" style="max-width:700px" id="about">
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
        <footer class="w3-padding-64 w3-light-grey w3-small w3-center" id="footer">
            <div class="w3-row-padding">
                <h4>Store</h4>
                <p>
                    <i class="fa fa-fw fa-map-marker"></i> Company Name</p>
                <p>
                    <i class="fa fa-fw fa-phone"></i> 0044123123</p>
                <p>
                    <i class="fa fa-fw fa-envelope"></i> ex@mail.com</p>
                <br>
                <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
                <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
                <i class="fa fa-snapchat w3-hover-opacity w3-large"></i>
                <i class="fa fa-pinterest-p w3-hover-opacity w3-large"></i>
                <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
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
      imgData: ["Anti-dismantle1", "Anti-dismantle2", "Anti-dismantle3"],
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
        [
          { id: "benz", name: "Benz" },
          { id: "benz4", name: "Benz" },
          { id: "bmw", name: "BMW" },
          { id: "bmw2", name: "BMW" }
        ],
        [
          { id: "la", name: "Lamborghini" },
          { id: "fa", name: "Ferrari" },
          { id: "fa1", name: "Ferrari" },
          { id: "fa3", name: "Ferrari" }
        ],
        [
          { id: "por", name: "Porsche" },
          { id: "por2", name: "Porsche" },
          { id: "sa", name: "Hexalobular" },
          { id: "sa2", name: "Hexalobular" }
        ]
      ],
      modalUrl: "",
      isActive: true
    };
  },
  methods: {
    ashowSlideImg() {
      console.log("123469995");
      this.showSlideImg = true;
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
  },
  mounted() {},
  components: { slideImg }
};
</script>
<style >
</style>