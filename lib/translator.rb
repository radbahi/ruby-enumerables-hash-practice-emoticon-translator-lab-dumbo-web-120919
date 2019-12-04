require 'yaml'

def load_library(emoticonYAML)
  emoticonLoad = YAML.load_file('./lib/emoticons.yml')

  emoticon_lib = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticons.each do |meaning, value|
   
    english = value[0]
    japanese = value[1]
    
    emoticonLoad['get_meaning'][japanese] = meaning
    emoticonLoad['get_emoticon'][english] = japanese
  end
  emoticonLoad
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