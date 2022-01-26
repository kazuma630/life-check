<template>
  <div id="app">
    <h1>Todo App</h1>
    <p v-for="user in state.users" v-bind:key="user.id">
      {{ user.nickname }}
    </p>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, onMounted } from 'vue' // defineComponent関数（TypeScriptを取り入れる場合に必要）などを読み込む
import { getUsers } from './lib/api/users' // APIを呼び出すための関数を読み込む
import { User } from './interfaces/index' // 型定義を読み込む

interface State {
  users: User[]
  nickname: string
}

export default defineComponent({
  setup() {
    const state = reactive<State>({
      users: [],
      nickname: ''
    })

    // ユーザー一覧を取得
    const handleGetUsers = async (): Promise<void> => {
      try {
        const res = await getUsers()

        if (res?.status === 200) {
          state.users = res.data.users // users（配列）に結果を格納
        }
      } catch (err) {
        console.log(err)
      }
    }

    // Vueインスタンスがマウントされるたびに実行
    onMounted(() => {
      handleGetUsers()
    })

    return {
      state
    }
  }
})
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
</style>
