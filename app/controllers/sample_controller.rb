class SampleController < ApplicationController
  require 'Dijkstra'
  
  def new
  	 #d = Dijkstra.new(["C-D","C-G","D-C","D-E","D-A","E-D","E-F","E-B","F-E","F-C#","G-C","G-A","A-D","A-G","A-B","B-E","B-A","B-C#","C#-F","G-D#","A-F#","B-G#","C#-A#","D#-G","D#-F#","F#-A","F#-G#","G#-F#","G#-B","G#-A#","A#-C#","A#-G#","D#-Ab","F#-Db","G#-Eb","A#-Bb","Ab-D#","Ab-Db","Db-F#","Db-Eb","Db-Ab","Eb-G#","Eb-Bb","Bb-Eb","Bb-A#","Eb-Db"])
  	 d = Dijkstra.new(["C-D","C-G","D-E","D-A","E-F","E-B","F-E","F-C#","G-A","A-B","B-C#","C#-F","G-D#","A-F#","B-G#","C#-A#","D#-F#","F#-G#","G#-F#","G#-A#","D#-Ab","F#-Db","G#-Eb","Db-Ab","Eb-G#","Eb-Bb","Bb-A#","Eb-Db"])
  	 @dama = d.getShortestPath(params[:current],params[:destination])
  	 flash[:notice] = "Shortest route."
  end  
end
