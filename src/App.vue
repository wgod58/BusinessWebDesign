<template>
  <div v-if="isShow" class="home w3-display-middle">
    <img
      alt="logo"
      class="w3-animate-fading w3-image"
      src="./assets/images/pick/logo.jpg"
      width="100%"
      height="100%"
    />
  </div>
  <div v-else class="mainBody">
    <div class="w3-top w3-bar w3-white w3-wide w3-padding w3-card w3-row">
      <div class="w3-col s12 m6 w3-center">
        <a v-on:click="toMainPage" class="w3-bar-item w3-button">
          <img class="logo w3-image w3-animate-zoom" src="./assets/images/pick/logo.jpg" alt="logo" />
        </a>
      </div>
      <div class="w3-col m6 w3-center" id="navbarItem">
        <a v-on:click="toElement('#showCase')" class="w3-button">
          <b>Showcase</b>
        </a>
        <a v-on:click="toElement('#about')" class="w3-button">
          <b>About</b>
        </a>
        <a v-on:click="toElement('#contact')" class="w3-button">
          <b>Contact</b>
        </a>
      </div>
    </div>

    <!-- Header -->
    <header
      v-show="!showSlideImg"
      class="w3-center w3-display-container w3-content w3-wide w3-margin-top"
      style="max-width:1000px"
      id="home"
    >
      <img
        class="w3-image w3-animate-zoom"
        src="./assets/images/pick/b.jpg"
        alt="Architecture"
        width="1500"
        height="800"
        id="homeImg"
      />
    </header>
    <SlideImg v-show="showSlideImg" v-bind:imgData="imgData" id="slideImg"></SlideImg>

    <!-- Page content -->
    <div class="w3-content w3-padding" style="max-width:1564px">
      <!-- Project Section 1 -->
      <div class="showCase w3-container" id="showCase">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
          <b>Titanium bolts</b>
        </h3>
      </div>
      <div class="w3-section">
        <button
          v-bind:key="index"
          v-on:click="showTitaniumSlideImg(index)"
          v-for="(item, index) in titaniumItems"
          v-bind:class="{ 'w3-black': index%2==0 }"
          class="w3-large w3-button w3-block"
        >
          <b>{{item.name}}</b>
        </button>
      </div>

      <!-- Project Section 2 -->

      <div class="showCase w3-container" id="showCase">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
          <b>Modified Screw</b>
        </h3>
      </div>
      <div class="w3-section">
        <button
          v-bind:key="index"
          v-on:click="ashowSlideImg(index)"
          v-for="(item, index) in modifiedScrewArrays"
          v-bind:class="{ 'w3-black': index%2==0 }"
          class="w3-large w3-button w3-block"
        >
          <b>{{item}}</b>
        </button>
      </div>

      <!-- About Section -->
      <div class="showCase w3-container w3-padding-32" id="about">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
          <b>ABOUT US</b>
        </h3>
      </div>
      <div class="about w3-content" style="max-width:700px">
        <p>Apex Metalle Design specializes on designing and manufacturing a variety of customized metallic products with top of the line quality to satisfy every desire of the high end market.</p>
        <p>We love to accept different challenges and any kind of cooperation methods with our clients for their specific needs. Any metallic product designing or product manufacturing ideas are welcomed to discuss with us. We as a company will meet the highest of standards from our clients to the best of our ability.</p>
        <p>Our brand believes in the infinite possibilities that different designs can bring to our lives, and we will continue to uphold our quality to the highest standards of manufacturing !</p>
        <div class="w3-panel w3-leftbar w3-light-grey">
          <p>
            <i>“It’s our passion to bring a little more amazement to the world.”</i>
          </p>
          <p class="w3-right">-ApexMetalleDesign</p>
        </div>
      </div>
      <!-- Contact Section -->
      <div class="w3-container w3-padding-32" id="contact">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
          <b>Contact</b>
        </h3>
        <p>Let's get in touch !</p>
        <form v-on:submit.prevent="sendMail()">
          <input
            v-model="name"
            class="w3-input w3-border"
            type="text"
            placeholder="Name"
            name="Name"
            required
          />
          <input
            v-model="email"
            class="w3-input w3-section w3-border"
            type="text"
            placeholder="Email"
            name="Email"
            required
          />
          <input
            v-model="subject"
            class="w3-input w3-section w3-border"
            type="text"
            placeholder="Subject"
            name="Subject"
            required
          />
          <textarea
            id="textarea"
            v-model="content"
            class="w3-input w3-section w3-border"
            type="text"
            placeholder="Comment"
            name="Comment"
            required
          ></textarea>
          <button v-show="!sendMsgDisabled" class="w3-button w3-black w3-section" type="submit">
            <i class="fa fa-paper-plane"></i> SEND MESSAGE
          </button>
        </form>
        <span
          id="countdownMsg"
          class="w3-section"
          v-show="sendMsgDisabled"
        >{{"You can resend message after " + rTime + " seconds"}}</span>
      </div>

      <!-- End page content -->
    </div>

    <!-- Footer -->
    <footer class="w3-light-grey w3-small w3-center" id="footer">
      <div class="w3-row-padding">
        <p>
          <i class="fa fa-fw fa-fax"></i> +886 229883108
        </p>
        <p>
          <i class="fa fa-fw fa-envelope"></i> amd@apexmetalledesign.com
        </p>
        <div class="w3-col w3-center">
          <img id="logo2" class="w3-image" src="./assets/images/pick/logo2.jpg" alt="logo" />
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

<script>
import SlideImg from './components/slideImg.vue';
import $ from 'jquery';

export default {
  name: 'App',
  components: {
    SlideImg,
  },
  data() {
    return {
      isShow: true,
      name: '',
      email: '',
      subject: '',
      content: '',
      imgData: [
        'H1.jpg',
        'H2.jpg',
        'H3.jpg',
        'H4.jpg',
        'H5.jpg',
        'Hexalobular5.JPG',
        'Hexalobular6.JPG',
      ],
      showSlideImg: false,
      slideIndex: 1,
      modifiedScrewArrays: [
        'Hexalobular',
        'Anti-dismantle',
        'Propeller',
        'triplegram',
        'Shield',
        'Steed',
        'Bull',
      ],
      modifiedScrewArrayItems: [
        [
          'H1.jpg',
          'H2.jpg',
          'H3.jpg',
          'H4.jpg',
          'H5.jpg',
          'Hexalobular5.JPG',
          'Hexalobular6.JPG',
        ],
        ['A1.jpg', 'A2.jpg', 'A3.jpg'],
        ['P1.jpg', 'P2.jpg', 'P3.jpg', 'Propeller5.JPG', 'Propeller6.JPG'],
        ['T1.jpg', 'T2.jpg', 'T3.jpg', 'T4.jpg', 'triplegram5.JPG'],
        ['Shield1.JPG', 'Shield2.JPG', 'Shield3.JPG', 'Shield4.JPG'],
        ['S2.jpg', 'Steed1.JPG', 'S1.jpg', 'Steed4.JPG'],
        ['B1.jpg', 'B2.jpg', 'B3.jpg', 'Bull4.JPG'],
      ],
      titaniumItems: [
        {
          name: 'Lamborghini',
          text: 'TI6AL4V M14 - P1.5 x 35L',
          data: [
            'titanium/l1.jpg',
            'titanium/l2.jpg',
            'titanium/l3.jpg',
            'titanium/l4.jpg',
            'titanium/l5.jpg',
            'titanium/l6.jpg',
            'titanium/l7.jpg',
            'titanium/l8.jpg',
            'titanium/l9.jpg',
            'titanium/l10.jpg',
            'titanium/l11.jpg',
            'titanium/l12.jpg',
            'titanium/l13.jpg',
            'titanium/l14.jpg',
            'titanium/l15.jpg',
            'titanium/l16.jpg',
            'titanium/l17.jpg',
          ],
        },
        {
          name: 'Porsche',
          text: 'TI6AL4V M14 - P1.5 x 35L',
          data: [
            'titanium/p1.jpg',
            'titanium/p2.jpg',
            'titanium/p3.jpg',
            'titanium/p4.jpg',
            'titanium/p5.jpg',
            'titanium/p6.jpg',
            'titanium/p7.jpg',
            'titanium/p8.jpg',
            'titanium/p9.jpg',
            'titanium/p10.jpg',
            'titanium/p11.jpg',
            'titanium/p1-min.jpg',
            'titanium/p2-min.jpg',
            'titanium/p3-min.jpg',
            'titanium/p4-min.jpg',
            'titanium/p5-min.jpg',
            'titanium/p6-min.jpg',
            'titanium/p7-min.jpg',
            'titanium/p8-min.jpg',
            'titanium/p9-min.jpg',
            'titanium/p10-min.jpg',
            'titanium/p11-min.jpg',
          ],
        },
        {
          name: 'Maserati',
          text: 'TI6AL4V M14 - P1.5 x 35L',
          data: [
            'titanium/m1.jpg',
            'titanium/m2.jpg',
            'titanium/m3.jpg',
            'titanium/m4.jpg',
            'titanium/m5.jpg',
            'titanium/m6.jpg',
            'titanium/m7.jpg',
            'titanium/m8.jpg',
            'titanium/m9.jpg',
            'titanium/m10.jpg',
            'titanium/m11.jpg',
          ],
        },
        {
          name: 'BMW',
          text: 'TI6AL4V M14 - P1.5 x 35L',
          data: [
            'titanium/b1.jpg',
            'titanium/b2.jpg',
            'titanium/b3.jpg',
            'titanium/b4.jpg',
            'titanium/b5.jpg',
            'titanium/b6.jpg',
            'titanium/b7.jpg',
            'titanium/b8.jpg',
            'titanium/b9.jpg',
            'titanium/b10.jpg',
          ],
        },
      ],
      modalUrl: '',
      isActive: true,
      sendMsgDisabled: false,
      rTime: 60,
    };
  },
  methods: {
    toElement(data) {
      var height = $(data).offset().top;
      var $htmlBody = $('html, body');
      $htmlBody.animate(
        {
          scrollTop: height - 40,
        },
        600
      );
    },
    toMainPage() {
      this.showSlideImg = false;
      this.scrollToTop();
    },
    ashowSlideImg(index) {
      this.imgData = this.modifiedScrewArrayItems[index];
      this.showSlideImg = true;
      this.scrollToTop();
    },
    showTitaniumSlideImg(index) {
      this.imgData = this.titaniumItems[index].data;
      this.showSlideImg = true;
      this.scrollToTop();
    },

    scrollToTop() {
      var body = $('html, body');
      body.stop().animate({ scrollTop: 0 }, 500);
    },
    sendMail() {
      var self = this;
      if (self.name && self.email && self.subject && self.content) {
        self.showModal();
        self.sendMailAjax();
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
    sendMailAjax() {
      var self = this;
      var template_params = {
        name: self.name,
        from: self.email,
        subject: self.subject,
        content: self.content,
      };
      var service_id = 'default_service';
      var template_id = 'apexmail';
      window.emailjs.send(service_id, template_id, template_params);
    },
    showModal() {
      document.getElementById('modal01').style.display = 'block';
      setTimeout(function () {
        document.getElementById('modal01').style.display = 'none';
      }, 4000);
    },
  },
  created: function () {
    setTimeout(() => {
      this.isShow = false;
    }, 4500);
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.home {
  width: 100%;
}

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
