
import Pkg
Pkg.activate(Base.current_project())

using DataFrames
using Statistics
using Query

A = [12.6, 12, 11.8, 11.9, 13, 12.5, 14]
B = [10, 10.2, 10, 12, 14, 13]
C = [10.1, 13, 13.4, 12.9, 8.9, 10.7, 13.6, 12]

allScores = [A; B; C]


groups = [repeat(["A"], length(A)); repeat(["B"], length(B));
          repeat(["C"], length(C))]

df = DataFrame(group = groups, score = allScores)

dGroupMeans = df |>
	@groupby(_.group) |>
	@map({group = key(_), score_mean = mean(_.score)}) |>
	@orderby(_.score_mean)

dGroupMeans |>
	@filter(_.group == "B") |>
	@select(:score_mean) |>
	print
