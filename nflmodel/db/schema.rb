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

ActiveRecord::Schema.define(version: 20141125104407) do

  create_table "defenseplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "tkl"
    t.integer  "ast"
    t.integer  "sk"
    t.integer  "int"
    t.integer  "ffum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "defenseplayerstats", ["game_id"], name: "index_defenseplayerstats_on_game_id"
  add_index "defenseplayerstats", ["player_id"], name: "index_defenseplayerstats_on_player_id"
  add_index "defenseplayerstats", ["team_id"], name: "index_defenseplayerstats_on_team_id"

  create_table "fumblesplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "tot"
    t.integer  "rcv"
    t.integer  "trcv"
    t.integer  "yds"
    t.integer  "lost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fumblesplayerstats", ["game_id"], name: "index_fumblesplayerstats_on_game_id"
  add_index "fumblesplayerstats", ["player_id"], name: "index_fumblesplayerstats_on_player_id"
  add_index "fumblesplayerstats", ["team_id"], name: "index_fumblesplayerstats_on_team_id"

  create_table "gamedriveplays", force: true do |t|
    t.integer  "gamedrive_id"
    t.integer  "sp"
    t.integer  "qtr"
    t.integer  "down"
    t.integer  "starttime"
    t.integer  "yrdln"
    t.integer  "ydstogo"
    t.integer  "ydsnet"
    t.string   "desc"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamedriveplays", ["gamedrive_id"], name: "index_gamedriveplays_on_gamedrive_id"

  create_table "gamedrives", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "qtr"
    t.boolean  "redzone"
    t.integer  "fds"
    t.string   "result"
    t.integer  "penyds"
    t.integer  "ydsgained"
    t.integer  "numplays"
    t.integer  "postime"
    t.integer  "starttime"
    t.integer  "endtime"
    t.integer  "startpos"
    t.integer  "endpos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamedrives", ["game_id"], name: "index_gamedrives_on_game_id"
  add_index "gamedrives", ["team_id"], name: "index_gamedrives_on_team_id"

  create_table "games", force: true do |t|
    t.string   "gameid"
    t.string   "gametype"
    t.string   "weather"
    t.string   "media"
    t.string   "yl"
    t.string   "qtr"
    t.string   "note"
    t.integer  "down"
    t.integer  "togo"
    t.boolean  "redzone"
    t.integer  "clock"
    t.string   "posteam"
    t.string   "stadium"
    t.date     "gamedate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gamescoresummaries", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.string   "scoretype"
    t.string   "desc"
    t.integer  "qtr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamescoresummaries", ["game_id"], name: "index_gamescoresummaries_on_game_id"
  add_index "gamescoresummaries", ["team_id"], name: "index_gamescoresummaries_on_team_id"

  create_table "kickingplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "fgm"
    t.integer  "fga"
    t.integer  "fgyds"
    t.integer  "totpfg"
    t.integer  "xpmade"
    t.integer  "xpmissed"
    t.integer  "xpa"
    t.integer  "xpb"
    t.integer  "xptot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kickingplayerstats", ["game_id"], name: "index_kickingplayerstats_on_game_id"
  add_index "kickingplayerstats", ["player_id"], name: "index_kickingplayerstats_on_player_id"
  add_index "kickingplayerstats", ["team_id"], name: "index_kickingplayerstats_on_team_id"

  create_table "kickreturnplayerstats", force: true do |t|
    t.integer  "ret"
    t.integer  "avg"
    t.integer  "tds"
    t.integer  "lng"
    t.integer  "lngtd"
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kickreturnplayerstats", ["game_id"], name: "index_kickreturnplayerstats_on_game_id"
  add_index "kickreturnplayerstats", ["player_id"], name: "index_kickreturnplayerstats_on_player_id"
  add_index "kickreturnplayerstats", ["team_id"], name: "index_kickreturnplayerstats_on_team_id"

  create_table "passingplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "att"
    t.integer  "cmp"
    t.integer  "yds"
    t.integer  "tds"
    t.integer  "ints"
    t.integer  "twopta"
    t.integer  "twoptm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passingplayerstats", ["game_id"], name: "index_passingplayerstats_on_game_id"
  add_index "passingplayerstats", ["player_id"], name: "index_passingplayerstats_on_player_id"
  add_index "passingplayerstats", ["team_id"], name: "index_passingplayerstats_on_team_id"

  create_table "playerdriveplays", force: true do |t|
    t.integer  "gamedriveplay_id"
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "statid"
    t.integer  "yards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playerdriveplays", ["gamedriveplay_id"], name: "index_playerdriveplays_on_gamedriveplay_id"
  add_index "playerdriveplays", ["player_id"], name: "index_playerdriveplays_on_player_id"
  add_index "playerdriveplays", ["team_id"], name: "index_playerdriveplays_on_team_id"

  create_table "players", force: true do |t|
    t.string   "playerid"
    t.string   "name"
    t.datetime "started"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "puntingplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "pts"
    t.integer  "yds"
    t.integer  "avg"
    t.integer  "i20"
    t.integer  "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "puntingplayerstats", ["game_id"], name: "index_puntingplayerstats_on_game_id"
  add_index "puntingplayerstats", ["player_id"], name: "index_puntingplayerstats_on_player_id"
  add_index "puntingplayerstats", ["team_id"], name: "index_puntingplayerstats_on_team_id"

  create_table "puntreturnplayerstats", force: true do |t|
    t.integer  "ret"
    t.integer  "avg"
    t.integer  "tds"
    t.integer  "lng"
    t.integer  "lngtd"
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "puntreturnplayerstats", ["game_id"], name: "index_puntreturnplayerstats_on_game_id"
  add_index "puntreturnplayerstats", ["player_id"], name: "index_puntreturnplayerstats_on_player_id"
  add_index "puntreturnplayerstats", ["team_id"], name: "index_puntreturnplayerstats_on_team_id"

  create_table "receivingplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "rec"
    t.integer  "yds"
    t.integer  "tds"
    t.integer  "lng"
    t.integer  "lngtd"
    t.integer  "twopta"
    t.integer  "twoptm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receivingplayerstats", ["game_id"], name: "index_receivingplayerstats_on_game_id"
  add_index "receivingplayerstats", ["player_id"], name: "index_receivingplayerstats_on_player_id"
  add_index "receivingplayerstats", ["team_id"], name: "index_receivingplayerstats_on_team_id"

  create_table "rosterplayers", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "pos"
    t.string   "status"
    t.integer  "jersey"
    t.string   "hgt"
    t.integer  "wgt"
    t.date     "bday"
    t.integer  "exp"
    t.string   "college"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rosterplayers", ["player_id"], name: "index_rosterplayers_on_player_id"
  add_index "rosterplayers", ["team_id"], name: "index_rosterplayers_on_team_id"

  create_table "rushingplayerstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "att"
    t.integer  "yds"
    t.integer  "tds"
    t.integer  "lng"
    t.integer  "lngtd"
    t.integer  "twopta"
    t.integer  "twoptm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rushingplayerstats", ["game_id"], name: "index_rushingplayerstats_on_game_id"
  add_index "rushingplayerstats", ["player_id"], name: "index_rushingplayerstats_on_player_id"
  add_index "rushingplayerstats", ["team_id"], name: "index_rushingplayerstats_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "abbr"
    t.string   "city"
    t.string   "teamname"
    t.datetime "estd"
    t.string   "conf"
    t.string   "div"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teamstats", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.string   "teamtype"
    t.integer  "q1"
    t.integer  "q2"
    t.integer  "q3"
    t.integer  "q4"
    t.integer  "q5"
    t.integer  "total"
    t.integer  "to"
    t.integer  "totfd"
    t.integer  "totyds"
    t.integer  "pyds"
    t.integer  "ryds"
    t.integer  "pen"
    t.integer  "penyds"
    t.integer  "trnovr"
    t.integer  "pt"
    t.integer  "ptyds"
    t.integer  "ptavg"
    t.integer  "top"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teamstats", ["game_id"], name: "index_teamstats_on_game_id"
  add_index "teamstats", ["team_id"], name: "index_teamstats_on_team_id"

end
