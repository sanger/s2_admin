#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define ["models/s2_base/s2_laboratory", "models/search"], (S2Laboratory, Search) -> 

  class Batch extends S2Laboratory

    searchForLabware: (labwareType, action = "first") ->
      search = new Search
      search.labwareByBatch this, labwareType, action
