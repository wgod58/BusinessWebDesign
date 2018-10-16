<template>
  <div class="w3-display-middle">
    <img class="w3-animate-top w3-image" src="./assets/images/pick/logo.jpg" alt="logo" width="100%" height="100%">
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
      this.$router.push("mainbody");
    }, 2000);
  },
  components: {}
};
</script>
<style>
</style>