#!/bin/bash

season_dir=$(basename "$PWD")
series_dir=$(basename "$(dirname "$PWD")")

n_mp4=1
n_ass=1
n_srt=1
n_smi=1

mv_list=()

for ext in mp4 ass srt smi; do
  # find 결과를 배열로 먼저 읽고, for 루프 돌림 (=> 서브쉘 문제 회피)
  IFS=$'\n' read -d '' -r -a files < <(find . -maxdepth 1 -type f -iname "*.${ext}" | sort -V && printf '\0')

  for file in "${files[@]}"; do
    [[ -f "$file" ]] || continue

    case "$ext" in
    mp4)
      ep_num=$(printf "%02d" "$n_mp4")
      newname="${series_dir} ${season_dir}E${ep_num}.mp4"
      ((n_mp4++))
      ;;
    ass)
      ep_num=$(printf "%02d" "$n_ass")
      newname="${series_dir} ${season_dir}E${ep_num}.ko.ass"
      ((n_ass++))
      ;;
    srt)
      ep_num=$(printf "%02d" "$n_srt")
      newname="${series_dir} ${season_dir}E${ep_num}.ko.srt"
      ((n_srt++))
      ;;
    smi)
      ep_num=$(printf "%02d" "$n_smi")
      newname="${series_dir} ${season_dir}E${ep_num}.ko.smi"
      ((n_smi++))
      ;;
    esac

    mv_list+=("mv -i -- \"$file\" \"$newname\"")
  done
done

# 미리 보기
echo "📋 Preview rename episodes:"
for cmd in "${mv_list[@]}"; do
  echo "$cmd"
done

# 확인 요청
read -p "Proceed with renaming? [y/N]: " confirm
if [[ "$confirm" != [yY] ]]; then
  echo "❌ Cancelled."
  exit 1
fi

# 실제 실행
for cmd in "${mv_list[@]}"; do
  eval "$cmd"
done

echo "✅ Done."
