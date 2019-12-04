require 'yaml'

def load_library(emoticonYAML)
  emoticonLoad = YAML.load_file('./lib/emoticons.yml')

  emoticonExtract = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticonLoad.each do |meaning, value|
   
    english = value[0]
    japanese = value[1]
    
    emoticonExtract['get_meaning'][japanese] = meaning
    emoticonExtract['get_emoticon'][english] = japanese
  end
  emoticonExtract
end


def get_japanese_emoticon(emoticonYAML, emoticon)
  emoticonExtract = load_library(emoticonYAML)
  japaneseEmoticon = emoticonExtract['get_emoticon'][emoticon]
  japaneseEmoticon ? japaneseEmoticon : 'Error, no emoticon found'
end

def get_english_meaning(emoticonYAML, emoticon)
  emoticon_lib = load_library(emoticonYAML)
  english_meaning = emoticon_lib['get_meaning'][emoticon]
  english_meaning ? english_meaning : 'Sorry, that emoticon was not found'
end