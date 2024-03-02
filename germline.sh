plink --bfile ps2_ibd.lwk --recode --out output_project

./germline -input output_project.ped output_project.map -output output_matches