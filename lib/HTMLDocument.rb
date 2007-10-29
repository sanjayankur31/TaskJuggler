#
# HTMLDocument.rb - The TaskJuggler3 Project Management Software
#
# Copyright (c) 2006, 2007 by Chris Schlaeger <cs@kde.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#

require 'XMLDocument'

# HTMLDocument objects are a specialized form of XMLDocument objects. All
# mandatory elements of a proper HTML document will be added automatically
# upon object creation.
class HTMLDocument < XMLDocument

  # When creating a HTMLDocument the caller can specify the type of HTML that
  # will be used. The constructor then generates the proper XML declaration
  # for it. :strict, :transitional and :frameset are supported for _docType_.
  def initialize(docType = :transitional)
    super()

    @elements << XMLBlob.new('<?xml version="1.0" encoding="utf8"?>')
    case docType
    when :strict
      dtdRef = 'Strict'
      url = 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'
    when :transitional
      dtdRef = 'Transitional'
      url = 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'
    when :frameset
      dtdRef = 'Frameset'
      url = 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd'
    else
      raise "Unsupported docType"
    end
    @elements << XMLBlob.new('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 ' +
                            "#{dtdRef}//EN\" \"#{url}\">")
    @elements << XMLComment.new('This file has been generated by ' +
                                "#{AppConfig.appName} v#{AppConfig.version}")
    @elements << (@html = XMLElement.new('html', 'xml:lang' => 'en',
      'lang' => 'en', 'xmlns' => 'http://www.w3.org/1999/xhtml'))
  end

  # Overload the << operator to append to the @html element instead of the
  # @elements Array.
  def <<(element)
    @html << element
  end

end

