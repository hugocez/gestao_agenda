# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140910223255) do

  create_table "agendas", force: true do |t|
    t.date     "dt_agendada"
    t.time     "hr_inicio"
    t.decimal  "valor_final"
    t.integer  "cliente_id"
    t.boolean  "fg_finalizado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "funcionario_id"
    t.integer  "funcionario_servico_id"
  end

  add_index "agendas", ["funcionario_id", "dt_agendada", "hr_inicio"], name: "index_for_agendas_on_funcionario_and_hr_inic_and_dt_agendada", unique: true

  create_table "clientes", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "data_nasc"
    t.integer  "sexo"
    t.string   "cep"
    t.string   "logradouro"
    t.integer  "nro_logradouro"
    t.string   "compl_logradouro"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresa_lojas", force: true do |t|
    t.string   "nome"
    t.integer  "empresa_id"
    t.integer  "cep"
    t.string   "logradouro"
    t.integer  "nro_logradouro"
    t.string   "compl_logradouro"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", force: true do |t|
    t.string   "razao_social"
    t.string   "cnpj"
    t.date     "data_abertura"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "faixa_empresa_lojas", force: true do |t|
    t.integer  "empresa_loja_id"
    t.time     "hr_inicio"
    t.time     "hr_fim"
    t.integer  "dia_semana"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faixa_empresa_lojas", ["dia_semana"], name: "index_faixa_empresa_lojas_on_dia_semana", unique: true

  create_table "faixa_funcionario_servicos", force: true do |t|
    t.integer  "funcionario_servico_id"
    t.integer  "dia_semana"
    t.time     "hr_inicio"
    t.time     "hr_fim"
    t.decimal  "valor_base"
    t.integer  "duracao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faixa_funcionario_servicos", ["dia_semana", "hr_inicio", "valor_base"], name: "index_faixa_func_on_dia_semn_and_hr_inic_and_valor", unique: true

  create_table "funcionario_empresa_lojas", force: true do |t|
    t.integer  "empresa_loja_id"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcionario_servicos", force: true do |t|
    t.integer  "funcionario_id"
    t.integer  "servico_id"
    t.decimal  "valor_base"
    t.decimal  "perc_comissao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcionarios", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "data_nasc"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_loja_id"
  end

  create_table "servicos", force: true do |t|
    t.string   "descricao"
    t.integer  "tipo_servico_id"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_loja_id"
  end

  create_table "tipo_servicos", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "funcionario_id"
  end

end
