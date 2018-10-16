<template>
  <div :id=id class="app">
    <router-view></router-view>
  </div>
</template>
<script type="text/javascript">
export default {
  template: template,
  props: ["id"],
  data() {},
  methods: {},
  created: function() {
    console.log("Vue元件生成，id=" + this.id);
  },
  components: {}
};
</script>
<style>
</style>