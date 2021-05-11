<template>
  <div class="maps">
    <div class="title">地图设置</div>
    <div class="main">
      <div class="wrapper">
        <div
          v-for="(item, index) in mapList"
          :key="index"
          class="map-item"
          @click="toMap(item.id)"
        >
          <div
            class="map-bg"
            :style="{ background: 'url(' + bgList[index % 4] + ')' }"
          ></div>
          <div class="map-mask"></div>
          <div class="map-name" :style="{ fontSize: true ? '32px' : '18px' }">
            通天苑
          </div>
          <div class="delete-map">+</div>
        </div>
        <div class="map-item add-map" @click="addMap">+</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      bgList: [
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2266806691,3749553979&fm=26&gp=0.jpg",
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2252109179,238451938&fm=26&gp=0.jpg",
        "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=937847181,2174643299&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=471959811,4126902569&fm=11&gp=0.jpg",
      ],
      mapList: [
        { id: 1, name: "通天苑" },
        { id: 2, name: "东校区" },
        { id: 3, name: "西校区" },
      ],
    };
  },
  methods: {
    toMap(id) {
      this.$router.push("/setting/set_map/" + id);
    },
    addMap() {
      this.$router.push("/setting/set_map");
    },
  },
};
</script>

<style scoped>
.maps {
  height: 100%;
  display: flex;
  flex-direction: column;
}
.maps .title {
  font-size: 24px;
  font-weight: 500;
  line-height: 30px;
  padding-left: 17px;
  box-sizing: border-box;
  margin: 28px 0px;
  margin-left: 20px;
  margin-bottom: 3px;
  position: relative;
}
.maps .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
.maps .main {
  background-color: #fff;
  height: 100%;
  min-height: 500px;
  margin: 20px;
  margin-top: 22px;
  padding: 25px;
  box-sizing: border-box;

  border-radius: 4px;
  border: 1px solid #ebeef5;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
.main .wrapper {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.map-item {
  width: 15%;
  height: 150px;
  margin-right: 1.8%;
  margin-bottom: 25px;
  background-color: #fff;
  position: relative;
  top: 0px;

  border-radius: 5px;
  border: 1px solid #ebeef5;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  transition: all 200ms;
  cursor: pointer;
  overflow: hidden;
}
.map-item:nth-child(6n) {
  margin-right: 0px;
}
.map-name {
  width: 80%;
  margin: auto;
  position: relative;
  top: 50%;
  transform: translate(0, -50%);
  text-align: center;
  font-weight: 200;
  z-index: 10;
  color: #fff;
  letter-spacing: 2px;
}
.delete-map {
  display: none;

  width: 30px;
  height: 30px;
  position: absolute;
  top: 3px;
  right: 3px;
  color: #ebeef5;
  font-size: 40px;
  line-height: 30px;
  text-align: center;
  transform: rotate(45deg);
  font-weight: 200;
  z-index: 10;
}
.map-item:hover .delete-map {
  display: block;
}
.delete-map:hover {
  color: #2494d4;
}
.map-bg {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0px;
  top: 0px;

  background-position: center top;
  background-size: cover;
  filter: blur(3px);
  background-attachment: fixed;
  transition: all 200ms;
}
.map-mask {
  background-color: rgba(0, 0, 0, 0.486);
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0px;
  top: 0px;
  z-index: 1;
  transition: all 200ms;
}
.map-item:hover .map-mask {
  background-color: rgba(105, 105, 105, 0.185);
}
.map-item:hover .map-bg {
  /* filter: blur(4px); */
}
.map-item.add-map {
  box-shadow: none;
  border: 2px #aaa dashed;
  color: rgb(117, 117, 117);
  box-sizing: border-box;
  line-height: 145px;
  text-align: center;
  font-size: 100px;
  font-weight: 200;
  transition: 0ms;
}
.map-item.add-map:hover {
  color: #5e9ee7;
  border-color: #5a98df;
}
</style>