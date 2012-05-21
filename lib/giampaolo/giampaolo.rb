##########################################################################
#    Giovanni Capuano <webmaster@giovannicapuano.net>
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##########################################################################

class Giampaolo
	
	attr_accessor :mirror
	
	def add(scripts, to)
		fail = []
		FileUtils::mkdir_p(to) unless File.directory? to
		scripts.each do |s|
			script = get(s)
			unless script.empty?
				File.open("#{to}/#{s}", ?w) do |f|
					f.write(script)
				end
			else
				fail << s
			end
		end
		return fail
	end
	
	def append(scripts, file)
		fail = []
		scripts.each do |s|
			script = get(s)
			unless script.empty?
				File.open("#{file}", ?a) do |f| 
					f.write(script)
				end
			else
				fail << s
			end
		end
		return fail
	end
	
	def get(script)
		File.open(mirror) do |f|
				f.each do |l|
					split = l.trim.split('=>')
					name = split[0].gsub("'", '')
					if name == script
						content = split[1].gsub("'", '')
						return open(content).read
					end
				end
		end
		return ''
	end
	
	def valid_mirror?
		begin
			open(mirror).read
		rescue
			return false
		end
		return true
	end
	
end
