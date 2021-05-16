<template>
  <!-- 功能概述：1.信息罗列展示   2.点击元素触发父元素绑定的事件 -->
  <!-- 数据元素中：finished:true-红圆圈/false-绿对勾 -->
  <div
    class="data-list"
    :style="{ width: elWidth + 'px', height: elHeight + 'px' }"
  >
    <div class="header">{{ header }}</div>
    <slot></slot>
    <ul style="">
      <li
        v-for="item in dataList"
        :keyword="item.id"
        class="data-item"
        :class="{ active: item.id == value, could_delete: useDelete}"
        @click="handleItem(item.id)"
      >
        {{ item.name }}

        <!-- 删除按钮 -->
        <div v-if="useDelete" class="delete-btn" @click="deleteItem(item.id)">
          <span>+</span>
        </div>
        <!-- 红圆圈 -->
        <div
          :style="{ opacity: item.finished === false ? 1 : 0 }"
          class="red-circle"
        ></div>
        <!-- 绿对勾 -->
        <div
          :style="{ opacity: item.finished === true ? 1 : 0 }"
          class="green-tick"
        ></div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    // 信息源
    source: {
      type: Array,
    },
    // 键
    keyword: {},
    // 值
    label: {
      type: String,
    },
    // 长
    width: {
      type: Number,
    },
    // 宽
    height: {
      type: Number,
    },
    // 标题
    header: {
      type: String,
    },
    // v-model
    value: {},
    // 是否启用finished显示
    useFinished: {
      type: Boolean,
    },
    // 元素是否可被删除
    useDelete: {
      type: Boolean,
    },
  },
  mounted() {
    this.elWidth = this.width || 300;
    this.elHeight = this.height || 750;
    this.datakeyword = this.keyword || "id";
    this.dataLabel = this.label || "name";

    // this.dataList = this.source.map((item) => {
    //   return {
    //     id: item[this.datakeyword],
    //     name: item[this.dataLabel],
    //   };
    // });
  },
  computed: {
    dataList() {
      return this.source.map((item) => {
        return {
          id: item[this.datakeyword],
          name: item[this.dataLabel],
          finished: item.finished,
        };
      });
    }
  },
  data() {
    return {
      elWidth: 0,
      elHeight: 0,
      datakeyword: "",
      dataLabel: "",
    };
  },
  methods: {
    handleItem(id) {
      this.$emit("update:value", id);
    },
    deleteItem(id) {
      this.$emit("deleteItem",id)
    },
  },
};
</script>

<style lang="less" scoped>
.data-list {
  width: 300px;
  height: 750px;
  background-color: #fff;
  border-radius: 8px;
  padding: 5px;
  box-sizing: border-box;
  overflow: hidden;
  display: flex;
  flex-direction: column;

  .header {
    font-weight: 500;
    width: 100%;
    padding: 10px;
    font-size: 22px;
    transition: 0.3s;
    margin-bottom: 0px;
    box-sizing: border-box;
    border-bottom: 1px solid #eee;
  }

  ul {
    height: 100%;
    padding: 3px;
    overflow: auto;
    color: rgb(163, 163, 163);
    transition: 0.1s;
  }
  ul:hover {
    color: rgb(83, 83, 83);
  }
  ul::-webkit-scrollbar {
    /*滚动条整体样式*/
    width: 8px; /*高宽分别对应横竖滚动条的尺寸*/
    height: 1px;
  }
  ul::-webkit-scrollbar-thumb {
    /*滚动条里面小方块*/
    border-radius: 10px;
    background: #ffffff;
    transition: 0.2s;
  }
}

.data-list:hover ul::-webkit-scrollbar-thumb {
  background: #e9e9e9;
}

.data-item {
  width: 100%;
  padding: 8px 13px;
  font-size: 18px;
  border-radius: 5px;
  transition: 0.15s;
  margin-top: 5px;
  box-sizing: border-box;
  cursor: pointer;
  position: relative;

  .delete-btn,
  .red-circle,
  .green-tick {
    width: 16px;
    height: 16px;
    position: absolute;
    right: 15px;
    top: 14px;
    transition: 0.2s;
  }
  .delete-btn {
    transform: rotate(45deg);
    top: 7px;
    right: 5px;
    opacity: 0;
    width: 30px;
    height: 30px;
    font-size: 40px;
    transition: none;

    span {
      color: rgb(187, 187, 187);
      display: block;
      line-height: 26px;
      font-weight: 200;
    }
  }
  .red-circle {
    opacity: 0;
    background: url(/images/red-circle.png);
  }
  .green-tick {
    opacity: 0;
    background: url(/images/green-tick.png);
  }

}
.data-item.could_delete:hover {
  .red-circle {
    display: none;
  }
  .green-tick {
    display: none;
  }

}
.data-item:hover {
  background-color: #f5f5f5;
  color: rgb(3, 3, 3);
  .delete-btn {
    opacity: 1;
  }
  .delete-btn:hover span {
    color: rgb(156, 156, 156);
  }
}
.data-item.active {
  background-color: #d9ecff91;
  color: #1d7eef;

  :hover{

  }
}
</style>