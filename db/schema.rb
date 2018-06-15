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

ActiveRecord::Schema.define(version: 20180614131827) do

  create_table "rates", force: :cascade do |t|
    t.string "rsymbol", default: "XXXXXX", null: false
    t.date "rdate", null: false
    t.string "ask", default: "0.0000000000"
    t.string "bid", default: "0.0000000000"
    t.string "last", default: "0.0000000000"
    t.string "open", default: "0.0000000000"
    t.string "low", default: "0.0000000000"
    t.string "high", default: "0.0000000000"
    t.string "volume", default: "000000000000"
    t.string "volumeQuote", default: "0.0000000000"
    t.index ["rdate"], name: "index_rates_on_rdate"
    t.index ["rsymbol", "rdate"], name: "index_rates_on_rsymbol_and_rdate", unique: true
    t.index ["rsymbol"], name: "index_rates_on_rsymbol"
  end

end
