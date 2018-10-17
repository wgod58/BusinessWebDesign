<template>
  <div class="home w3-display-middle">
    <img class="w3-animate-fading w3-image" src="./assets/images/pick/logo.jpg" alt="logo" width="100%" height="100%">
  </div>

</template>
<script type="text/javascript">
export default {
  template: template,
  props: ["id"],
  data() {
    return {};
  },
  methods: {},
  created: function() {
    setTimeout(() => {
      this.$router.push({ name: "mainbody" });
    }, 4500);
  },
  components: {}
};
</script>
<style>
.home .w3-image {
  min-width: 450px;
}
</style>