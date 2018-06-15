class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string  :rsymbol,  default: 'XXXXXX',  null: false
      t.date    :rdate,    null: false

      t.string  :ask,     default: '0.0000000000'
      t.string  :bid,     default: '0.0000000000'
      t.string  :last,    default: '0.0000000000'
      t.string  :open,    default: '0.0000000000'
      t.string  :low,     default: '0.0000000000'
      t.string  :high,    default: '0.0000000000'
      t.string  :volume,  default: '000000000000'
      t.string  :volumeQuote, default: '0.0000000000'
    end

    add_index :rates, :rsymbol
    add_index :rates, :rdate
    add_index :rates, [ :rsymbol, :rdate ], unique: true
  end
end
