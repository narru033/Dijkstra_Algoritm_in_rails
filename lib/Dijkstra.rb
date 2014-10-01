	class Dijkstra
		
		# Each pair "A-B" represents a two way connection between the node A and the node B.
		# Example: 
		# d = Dijkstra.new(["A-B","B-C","C-D","D-E","E-B"])           
		# d.getShortestPath("A","D")
		  
		def initialize(connections)
		  @graph = Hash.new
		  for conn in connections
		    arrConn = conn.split('-')
		    if @graph[arrConn[0]] == nil
		    	@graph[arrConn[0]] = Array.new
		    end
		    @graph[arrConn[0]] << arrConn[1]
		    
		    if @graph[arrConn[1]] == nil
		    	@graph[arrConn[1]] = Array.new
		    end
		    @graph[arrConn[1]] << arrConn[0]      
		  end
		  
		  @settledNodes = Array.new
		  @unsettledNodes = Array.new
		  @distance = Hash.new
		  @predecessors = Hash.new      
		end
		
		def getShortestPath(initNode,endNode)
		  if initNode == endNode
		    #return "Your given Current position and Destination is same. Please Change"
		    return initNode
		  end
		  @distance[initNode] = 0
		  @unsettledNodes << initNode
		  @unsettledNodes.uniq!
		  while @unsettledNodes.length() > 0
		    node = getMinimum(@unsettledNodes)
		    @settledNodes << node
		    @settledNodes.uniq!
		    @unsettledNodes.delete(node)
		    findMinimalDistances(node)
		  end
		  return getPath(endNode)
		end
		
		def findMinimalDistances(node)
		  adjacentNodes = getNeighbors(node)
		  adjacentNodes.each{ |target|
		    if getShortestDistance(target) > (getShortestDistance(node) + getDistance(node, target))
		      @distance[target] = getShortestDistance(node)+getDistance(node, target)      
		      @predecessors[target] = node
		      @unsettledNodes << target
		      @unsettledNodes.uniq!
		    end
		  }
		end
		
		def getMinimum(nodes)
		  minNode = nil
		  nodes.each { |node|
		      if minNode == nil
		        minNode = node
		      else 
		        if getShortestDistance(node) < getShortestDistance(minNode)
		          minNode = node
		        end
		      end
		  }
		  return minNode
		end
		
		def getShortestDistance(destination)
		  d = @distance[destination]
		  if d == nil
		    return (2**(0.size * 8 -2) -1) #max integer
		  else
		    return d
		  end  
		end
		
		def getPath(target)
		  path = Array.new
		  step = target
		  if @predecessors[step] ==nil
		    return -1
		  end
		  path << target
		  while @predecessors[step] != nil
		    step = @predecessors[step]
		    path << step
		  end
		  if(path.empty?)
		    return -1
		  end
		  path.reverse!
		  return path.join('>>')
		end
	 
	 
		def getNeighbors(node)
		  return @graph[node]  
		end
		
		def getDistance(node, target)
		  if @graph[node].include? target
		    return 1
		  end
		  raise 'Should not happen!'
		end
	end
	
#C, D, E, F
#G, A, B, C#
#D#, F#, G#, A#
#Ab, Db, Eb, Bb

#d = Dijkstra.new(["C-D","C-G","D-C","D-E","D-A","E-D","E-F","E-B","F-E","F-C#","G-C","G-A","A-D","A-G","A-B","B-EDijkstra","B-A","B-C#","C#-F","C#-E","G-D#","A-F#","B-G#","C#-A#","D#-G","D#-F#","F#-A","F#-G#","G#-F#","G#-B","G#-A#","A#-C#","A#-G#","D#-Ab","F#-Db","G#-Eb","A#-Bb","Ab-D#","Ab-Db","Db-F#","Db-Eb","Db-Ab","Eb-G#","Eb-Bb","Bb-Eb","Bb-A#","Eb-Db"])           
#puts d.getShortestPath("C","Bb")
