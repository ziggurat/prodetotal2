json.competitions @competitions do |competition|
	json.partial! 'base_competition_info', competition: competition
end