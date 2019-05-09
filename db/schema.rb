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

ActiveRecord::Schema.define(version: 20190507182049) do

  create_table "atendimentos", force: :cascade do |t|
    t.integer  "building_id", limit: 4
    t.integer  "usuario_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "atendimentos", ["building_id"], name: "index_atendimentos_on_building_id", using: :btree
  add_index "atendimentos", ["usuario_id"], name: "index_atendimentos_on_usuario_id", using: :btree

  create_table "avisos", force: :cascade do |t|
    t.text     "descricao",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "usuario_id", limit: 4
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "building_type", limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "desativado",                default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_type", limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "desativado",                default: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.string   "parecer",    limit: 255
    t.integer  "request_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "usuario_id", limit: 4
  end

  add_index "comentarios", ["request_id"], name: "index_comentarios_on_request_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "department_type", limit: 255
    t.integer  "building_id",     limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "desativado",                  default: false
  end

  create_table "informativo_obras", force: :cascade do |t|
    t.string   "local",                limit: 255
    t.integer  "building_id",          limit: 4
    t.integer  "department_id",        limit: 4
    t.string   "andar",                limit: 255
    t.string   "laboratorio",          limit: 255
    t.string   "contratante",          limit: 255
    t.string   "ramal",                limit: 255
    t.string   "email",                limit: 255
    t.text     "descricao",            limit: 65535
    t.boolean  "intervencaologica"
    t.boolean  "intervencaotelefonia"
    t.string   "nomeemp",              limit: 255
    t.string   "cnpjemp",              limit: 255
    t.string   "foneemp",              limit: 255
    t.string   "responsavelemp",       limit: 255
    t.string   "rgemp",                limit: 255
    t.string   "nomeemergencia",       limit: 255
    t.string   "foneemergencia",       limit: 255
    t.date     "previnicio"
    t.date     "prevtermino"
    t.string   "origemrecurso",        limit: 255
    t.integer  "usuario_id",           limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "fotoobra1",            limit: 255
    t.string   "fotoobra2",            limit: 255
    t.string   "fotoobra3",            limit: 255
    t.string   "fotoobra4",            limit: 255
    t.string   "fotoobra5",            limit: 255
    t.string   "oficio1",              limit: 255
    t.string   "oficio2",              limit: 255
    t.string   "oficio3",              limit: 255
    t.string   "oficio4",              limit: 255
    t.string   "oficio5",              limit: 255
    t.string   "oficio6",              limit: 255
    t.string   "oficio7",              limit: 255
    t.string   "oficio8",              limit: 255
    t.string   "oficio9",              limit: 255
    t.string   "oficio10",             limit: 255
    t.string   "planta1",              limit: 255
    t.string   "planta2",              limit: 255
    t.string   "planta3",              limit: 255
    t.string   "planta4",              limit: 255
    t.string   "planta5",              limit: 255
    t.string   "planta6",              limit: 255
    t.string   "planta7",              limit: 255
    t.string   "planta8",              limit: 255
    t.string   "planta9",              limit: 255
    t.string   "planta10",             limit: 255
    t.integer  "statusobra_id",        limit: 4
    t.text     "justificativa",        limit: 65535
    t.date     "dataconclusao"
  end

  add_index "informativo_obras", ["building_id"], name: "index_informativo_obras_on_building_id", using: :btree
  add_index "informativo_obras", ["department_id"], name: "index_informativo_obras_on_department_id", using: :btree
  add_index "informativo_obras", ["usuario_id"], name: "index_informativo_obras_on_usuario_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.string   "acao",       limit: 255
    t.string   "ip",         limit: 255
    t.integer  "usuario_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "logs", ["usuario_id"], name: "index_logs_on_usuario_id", using: :btree

  create_table "perfils", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "permitidos", force: :cascade do |t|
    t.integer  "usuario_id", limit: 4
    t.integer  "perfil_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "permitidos", ["perfil_id"], name: "index_permitidos_on_perfil_id", using: :btree
  add_index "permitidos", ["usuario_id"], name: "index_permitidos_on_usuario_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "subject",             limit: 255
    t.string   "request_local",       limit: 255
    t.text     "problem_description", limit: 65535
    t.integer  "usuario_id",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "category_id",         limit: 4
    t.integer  "status_id",           limit: 4
    t.integer  "building_id",         limit: 4
    t.string   "foto1",               limit: 255
    t.string   "foto2",               limit: 255
    t.string   "foto3",               limit: 255
    t.integer  "tecnico_id",          limit: 4
    t.integer  "department_id",       limit: 4
    t.string   "statusfin",           limit: 255
    t.text     "material",            limit: 65535
    t.string   "verbamaterial",       limit: 255
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "status_type", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "desativado",              default: false
  end

  create_table "statusobras", force: :cascade do |t|
    t.string   "statusobra_type", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "desativado",                  default: false
  end

  create_table "tipo_vinculos", force: :cascade do |t|
    t.string   "tipoVinculo",         limit: 255
    t.string   "codigoSetor",         limit: 255
    t.string   "nomeAbreviadSetor",   limit: 255
    t.string   "nomeSetor",           limit: 255
    t.string   "codigoUnidade",       limit: 255
    t.string   "siglaUnidade",        limit: 255
    t.string   "nomeUnidade",         limit: 255
    t.string   "nomeVinculo",         limit: 255
    t.string   "nomeAbreviadoFuncao", limit: 255
    t.integer  "usuario_id",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "tipo_vinculos", ["usuario_id"], name: "index_tipo_vinculos_on_usuario_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nomeUsuario",             limit: 255
    t.string   "loginUsuario",            limit: 255
    t.string   "tipoUsuario",             limit: 255
    t.string   "emailPrincipalUsuario",   limit: 255
    t.string   "emailAlternativoUsuario", limit: 255
    t.string   "emailUspUsuario",         limit: 255
    t.string   "numeroTelefoneFormatado", limit: 255
    t.string   "ramalUsp",                limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_foreign_key "atendimentos", "buildings"
  add_foreign_key "atendimentos", "usuarios"
  add_foreign_key "comentarios", "requests"
  add_foreign_key "informativo_obras", "buildings"
  add_foreign_key "informativo_obras", "departments"
  add_foreign_key "informativo_obras", "usuarios"
  add_foreign_key "logs", "usuarios"
  add_foreign_key "permitidos", "perfils"
  add_foreign_key "permitidos", "usuarios"
  add_foreign_key "tipo_vinculos", "usuarios"
end
