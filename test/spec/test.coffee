#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
# global describe, it
define [], () ->

  describe 'Give it some context', () ->
    describe 'maybe a bit more context here', () ->
      it 'should runsadf asdf asdf asd a few assertions here', () ->
        expect(true).to.be.ok
