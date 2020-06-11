<template>
  <div class="slideImg w3-content w3-display-container" style="max-width:700px">
    <img
      id="slideImg"
      v-bind:key="index"
      v-for="(item, index) in imgsLocation"
      class="mySlides"
      v-bind:src="item"
      style="width:100%"
    />
    <div
      class="slider-item w3-center w3-section w3-large w3-text-gray w3-display-bottommiddle"
      style="width:100%"
    >
      <div class="wrapper">
        <div class="arrow-left w3-left w3-hover-text-khaki" v-on:click="plusDivs(-1)">&#10094;</div>
        <div class="arrow-right w3-right w3-hover-text-khaki" v-on:click="plusDivs(1)">&#10095;</div>
        <div class="circle-wrapper">
          <span
            v-bind:key="index"
            v-for="(item, index) in imgsLocation"
            class="img w3-badge demo w3-border w3-transparent w3-hover-gray"
            v-on:click="currentDiv(index+1)"
          >&nbsp;</span>&nbsp;
        </div>
      </div>
    </div>
  </div>
</template>

<script type="text/javascript">
export default {
  props: ['imgData'],
  data() {
    return {
      slideIndex: 1,
    };
  },
  methods: {
    plusDivs(n) {
      var self = this;
      self.showDivs((self.slideIndex += n));
    },
    currentDiv(n) {
      var self = this;
      self.showDivs((self.slideIndex = n));
    },
    showDivs(n) {
      var self = this;
      var i;
      var x = document.getElementsByClassName('mySlides');
      var dots = document.getElementsByClassName('demo');
      if (n > x.length) {
        self.slideIndex = 1;
      }
      if (n < 1) {
        self.slideIndex = x.length;
      }
      for (i = 0; i < x.length; i++) {
        x[i].style.display = 'none';
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(' w3-gray', '');
      }
      x[self.slideIndex - 1].style.display = 'block';
      dots[self.slideIndex - 1].className += ' w3-gray';
    },
  },
  created() {},
  watch: {
    imgData: function() {
      this.currentDiv(1);
    },
  },
  computed: {
    imgsLocation() {
      // var self = this;
      var data = [];
      for (var i = 0; i < this.imgData.length; i++) {
        data.push('./assets/images/pick/' + this.imgData[i]);
      }
      return data;
    },
  },
  mounted() {
    var self = this;
    self.showDivs(1);
  },
  components: {},
};
</script>
<style scoped>
.circle-wrapper {
  margin-top: 17px;
}

.slider-item {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 50px;
}

.slider-item .wrapper {
  width: 100%;
}
.slider-item .wrapper .arrow-left {
  padding: 13px 10px 13px 20px;
}
.slider-item .wrapper .arrow-right {
  padding: 13px 20px 13px 10px;
}

.slideImg .mySlides {
  display: none;
}
.slideImg .w3-left,
.slideImg .w3-right,
.slideImg .w3-badge {
  cursor: pointer;
  letter-spacing: 4px;
}
.slideImg .w3-badge {
  height: 13px;
  width: 13px;
  padding: 0;
}
.slideImg .img {
  margin: 3.5px;
  margin-top: -120px;
}
</style>