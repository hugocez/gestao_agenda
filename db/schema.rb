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

ActiveRecord::Schema.define(version: 20140827130246) do

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
