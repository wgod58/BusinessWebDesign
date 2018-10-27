<template>
  <div class="mainBody">
    <div class="w3-top w3-bar w3-white w3-wide w3-padding w3-card w3-row">
      <!-- <div class="w3-col s12 m6 w3-green w3-center">
        <a v-on:click="toMainPage" class=" w3-bar-item w3-button">
          <img class="logo w3-image" src="./assets/images/pick/logo.jpg" alt="logo">
        </a>
      </div>-->
      <!-- Float links to the right. Hide them on small screens -->
      <!--<div class="w3-col m6 w3-dark-grey w3-center " id="navbarItem">
        <a v-on:click='toElement(" #showCase")' class="w3-bar-item w3-button"><b>Showcase</b></a>
        <a v-on:click='toElement(" #about")' class="w3-bar-item w3-button"><b>About</b></a>
        <a v-on:click='toElement(" #contact")' class=" w3-bar-item w3-button"><b>Contact</b></a>
      </div>-->
      <div class="w3-col s12 m6 w3-center">
        <a v-on:click="toMainPage" class=" w3-bar-item w3-button">
          <img class="logo w3-image w3-animate-zoom" src="./assets/images/pick/logo.jpg" alt="logo">
        </a>
      </div>
      <div class="w3-col m6 w3-center" id="navbarItem">
        <a v-on:click='toElement(" #showCase")' class="w3-button"><b>Showcase</b></a>
        <a v-on:click='toElement(" #about")' class="w3-button"><b>About</b></a>
        <a v-on:click='toElement(" #contact")' class=" w3-button"><b>Contact</b></a>
      </div>
    </div>

    <!-- Header -->
    <header v-show="!showSlideImg" class="w3-center w3-display-container w3-content w3-wide w3-margin-top" style="max-width:700px" id="home">
      <img class="w3-image w3-animate-zoom" src="./assets/images/pick/b.jpg" alt="Architecture" width="1500" height="800" id="homeImg">
    </header>
    <slideImg v-show="showSlideImg" v-bind:imgData="imgData" v-show="showSlideImg" id="slideImg"> </slideImg>

    <!-- Page content -->
    <div class="w3-content w3-padding" style="max-width:1564px">

      <!-- Project Section -->
      <div class="showCase w3-container w3-padding-32" id="showCase">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><b>Modify Screw</b></h3>
      </div>
      <div class="w3-section">
        <button v-on:click='ashowSlideImg(index)' v-for="(item, index) in bArrays" v-bind:class="{ 'w3-black': index%2==0 }" class="w3-large w3-button w3-block "><b>{{item}}</b></button>
      </div>
      <!-- About Section -->
      <div class="showCase w3-container w3-padding-32" id="about">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><b>ABOUT US</b></h3>
      </div>
      <div class="about w3-content" style="max-width:700px">
        <p>Apex Metalle Design specializes on designing and manufacturing a variety of customized metallic products with top of the line quality to satisfy every desire of the high end market.</p>
        <p>We love to accept different challenges and any kind of cooperation methods with our clients for their specific needs. Any metallic product designing or product manufacturing ideas are welcomed to discuss with us. We as a company will meet the highest of standards from our clients to the best of our ability.</p>
        <p>Our brand believes in the infinite possibilities that different designs can bring to our lives, and we will continue to uphold our quality to the highest standards of manufacturing !</p>
        <div class="w3-panel w3-leftbar w3-light-grey">
          <p>
            <i>"Use products from nature for what it's worth - but never too early, nor too late." Fresh is the new sweet.</i>
          </p>
          <p>Chef, Coffeeist and Owner: Liam Brown</p>
        </div>
      </div>
      <!-- Contact Section -->
      <div class="w3-container w3-padding-32" id="contact">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><b>Contact</b></h3>
        <p>Let's get in touch !</p>
        <form v-on:submit.prevent="sendMail()">
          <input v-model="name" class="w3-input w3-border" type="text" placeholder="Name" name="Name" required>
          <input v-model="email" class="w3-input w3-section w3-border" type="text" placeholder="Email" name="Email" required>
          <input v-model="subject" class="w3-input w3-section w3-border" type="text" placeholder="Subject" name="Subject" required>
          <textarea id="textarea" v-model="content" class="w3-input w3-section w3-border" type="text" placeholder="Comment" name="Comment" required></textarea>
          <button v-show="!sendMsgDisabled" class="w3-button w3-black w3-section" type="submit">
            <i class="fa fa-paper-plane"></i> SEND MESSAGE
          </button>
        </form>
        <span id="countdownMsg" class="w3-section" v-show="sendMsgDisabled">{{"You can resend message after " + rTime + " seconds"}}</span>
      </div>

      <!-- End page content -->
    </div>

    <!-- Footer -->
    <footer class="w3-padding-30 w3-light-grey w3-small w3-center" id="footer">
      <div class="w3-row-padding">
        <p>
          <i class="fa fa-fw fa-fax"></i> 020411133333</p>
        <p>
          <i class="fa fa-fw fa-envelope"></i> amd@apexmetalledesign.com</p>
        <div class="w3-col w3-center">
          <img id="logo2" class=" w3-image " src="./assets/images/pick/logo2.jpg" alt="logo">
        </div>
      </div>
    </footer>
    <div id="modal01" class="w3-modal">
      <div class="w3-green w3-container w3-modal-content w3-card-4 w3-animate-zoom">
        <h1>Success</h1>
        <p>Thanks for your contact .</p>
      </div>
    </div>
  </div>
</template>

<script type="text/javascript">
import slideImg from "../head/slideImg";
export default {
  template: template,
  data() {
    return {
      name: "",
      email: "",
      subject: "",
      content: "",
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
        [
          "H1.jpg",
          "H2.jpg",
          "H3.jpg",
          "H4.jpg",
          "H5.jpg",
          "Hexalobular5.JPG",
          "Hexalobular6.JPG"
        ],
        ["A1.jpg", "A2.jpg", "A3.jpg"],
        ["P1.jpg", "P2.jpg", "P3.jpg", "Propeller5.JPG", "Propeller6.JPG"],
        ["T1.jpg", "T2.jpg", "T3.jpg", "T4.jpg", "triplegram5.JPG"],
        ["Shield1.JPG", "Shield2.JPG", "Shield3.JPG", "Shield4.JPG"],
        ["S2.jpg", "Steed1.JPG", "S1.jpg", "Steed4.JPG"],
        ["B1.jpg", "B2.jpg", "B3.jpg", "Bull4.JPG"]
      ],
      modalUrl: "",
      isActive: true,
      sendMsgDisabled: false,
      rTime: 60
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
      this.modalUrl = "./assets/images/pick/" + id;
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
    },
    sendMail() {
      var self = this;
      if (self.name && self.email && self.subject && self.content) {
        self.showModal();
        self.sendMailAjax("amd@apexmetalledesign.com");
        self.sendMailAjax("wgod58@gmail.com");
        self.sendMsgDisabled = true;
        let rTime = self.rTime;
        let interval = window.setInterval(() => {
          if (--self.rTime <= 0) {
            self.rTime = rTime;
            self.sendMsgDisabled = false;
            window.clearInterval(interval);
          }
        }, 1000);
      }
    },
    sendMailAjax(toEmail) {
      var self = this;
      Email.send(
        "apexSystem@apex.com",
        toEmail,
        "Contact info",
        "name : " +
          self.name +
          "<br>email : " +
          self.email +
          "<br>subject : " +
          self.subject +
          "<br>content : " +
          self.content,
        "smtp.gmail.com",
        "wu0h96321@gmail.com",
        "0922669551"
      );
    },
    showModal() {
      document.getElementById("modal01").style.display = "block";
      setTimeout(function() {
        document.getElementById("modal01").style.display = "none";
      }, 4000);
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
  width: 320px;
  height: 270px;
  margin-top: -100px;
  margin-bottom: -140px;
}

.mainBody #homeImg {
  margin-top: 77px;
}
.mainBody #slideImg {
  margin-top: 77px;
}
.mainBody #navbarItem {
  font-size: 10px;
}
.mainBody #logo2 {
  max-width: 300px;
  margin-top: -110px;
}
.mainBody #textarea {
  min-height: 110px;
}
</style>