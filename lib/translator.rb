require 'yaml'

def load_library(emoticonYAML)
  emoticonLoad = YAML.load_file('./lib/emoticons.yml')

  emoticonExtract = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticonLoad.each do |meaning, value|
   
    englishEmoticon = value[0]
    japaneseEmoticon = value[1]
    
    emoticonExtract['get_meaning'][japaneseEmoticon] = meaning
   
    emoticonExtract['get_emoticon'][englishEmoticon] = japanese
  end
  emoticonExtract
end


def get_japanese_emoticon(emoticonYAML, emoticon)
  emoticonExtract = load_library(emoticonYAML)
  japaneseEmoticon = emoticonExtract['get_emoticon'][emoticon]
  japaneseEmoticon ? japaneseEmoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticonYAML, emoticon)
  emoticonExtract = load_library(emoticonYAML)
  englishEmoticon = emoticonExtract['get_meaning'][emoticon]
  englishEmoticon ? englishEmoticon : 'Sorry, that emoticon was not found'
end