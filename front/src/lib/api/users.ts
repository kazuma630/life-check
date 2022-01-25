import { AxiosPromise } from 'axios'
import client from './client'
import { User } from '../../interfaces/index'

// getUsersを実行した際のレスポンスデータの型
interface GetUsersResponse {
  status: number
  users: User[]
  message: string
}

// User一覧を取得
export const getUsers = (): AxiosPromise<GetUsersResponse> => {
  return client.get('/users')
}