<template>
  <div id="app">
    <h1>Life check</h1>
    <div v-for="user in state.users" v-bind:key="user.id">
      <p>{{ user.nickname }}さん</p>
      <p>残された時間: {{ remainingHours(user.birth_at, user.sex) }}</p>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, onMounted } from 'vue' // defineComponent関数（TypeScriptを取り入れる場合に必要）などを読み込む
import { getUsers } from './lib/api/users' // APIを呼び出すための関数を読み込む
import { User } from './interfaces/index' // 型定義を読み込む
import moment from "moment"

interface State {
  users: User[]
  nickname: string
  birth_at: string
  sex: string
}

export default defineComponent({
  setup() {
    const state = reactive<State>({
      users: [],
      nickname: '',
      birth_at: '',
      sex: ''
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

    // 残り時間
    const remainingHours = (date: {date: any}, sex: string) => {
      const birthYear = moment(date).format('YYYY-MM-DD')
      if (sex == '1') {
        let birthEnd = moment(birthYear).add(82, 'y').format('YYYY-MM-DD');
        return moment(birthEnd).diff(birthYear, 'hours');
      }  else if (sex === '2') {
        let birthEnd = moment(birthYear).add(88, 'y').format('YYYY-MM-DD');
        return moment(birthEnd).diff(birthYear, 'hours');
      }
    }

    // Vueインスタンスがマウントされるたびに実行
    onMounted(() => {
      handleGetUsers()
    })

    return {
      state,
      remainingHours
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
