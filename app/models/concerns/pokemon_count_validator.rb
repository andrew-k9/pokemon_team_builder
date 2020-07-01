class PokemonCountValidator < ActiveModel::Validator
  def validate(record)
    count = record.pokemons.length
    message = "Count of #{count} must be greater than 0 at most 6!"
    record.errors[:team] << message unless count.positive? && count < 7
  end
end
