#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
# Base model for everything that uses the lims-manangement API

define ["models/s2_base/s2_model"], (S2Model) ->

  class S2Management extends S2Model

    baseUrl: () ->
      super() + "/lims-management"
