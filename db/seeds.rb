# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.create([
    { title: 'Ruby技術者認定試験合格教本', author: '牧俊男', isbn: '9784774191942', category: '技術', total_copies: 8 },
    { title: 'ノルウェイの森', author: '村上春樹', isbn: '9784800240222', category: '小説', total_copies: 10 },
    { title: 'コンビニ人間', author: '村田沙耶香', isbn: '9784334772041', category: '小説', total_copies: 15 },
    { title: '1Q84', author: '村上春樹', isbn: '9784103534648', category: '小説', total_copies: 20 },
    { title: '風の歌を聴け', author: '村上春樹', isbn: '9784087450836', category: '小説', total_copies: 5 },
    { title: '源氏物語', author: '紫式部', isbn: '9784101146019', category: '古典', total_copies: 8 },
    { title: '雪国', author: '川端康成', isbn: '9784101001010', category: '小説', total_copies: 7 },
    { title: '坊ちゃん', author: '夏目漱石', isbn: '9784780817550', category: '小説', total_copies: 4 },
    { title: '悪童日記', author: 'アゴタ・クリストフ', isbn: '9784770031582', category: '小説', total_copies: 10 },
    { title: 'アンドロイドは電気羊の夢を見るか?', author: 'フィリップ・K・ディック', isbn: '9784061034180', category: 'SF', total_copies: 6 }
  ])