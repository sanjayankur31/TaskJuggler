#!/usr/bin/env ruby -w
# frozen_string_literal: true
# encoding: UTF-8
#
# = AccountCredit.rb -- The TaskJuggler III Project Management Software
#
# Copyright (c) 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014
#               by Chris Schlaeger <cs@taskjuggler.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#

class TaskJuggler

  class AccountCredit

    attr_reader :date, :description, :amount

    def initialize(date, description, amount)
      @date = date
      @description = description
      @amount = amount
    end

  end

end

